// Copyright (c) 2018 Norwegian University of Science and Technology (NTNU)
// Copyright (c) 2019 Xilinx
//
// BSD v3 License
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of BISMO nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Chisel._
import bismo._
import org.scalatest.junit.JUnitSuite
import org.junit.Test
import BISMOTestHelpers._

class TestDotProductArray extends JUnitSuite {
  @Test def DotProdArrayTest {
    // Tester-derived class to give stimulus and observe the outputs for the
    // Module to be tested
    class DotProductArrayTester(c: DotProductArray) extends Tester(c) {
      val r = scala.util.Random
      // number of re-runs for each test
      val num_seqs = 1
      // number of bits in each operand
      val pc_len = c.p.dpuParams.inpWidth
      // max shift steps for random input
      val max_shift = BISMOLimits.maxShift
      println("Set maxShift = "+max_shift)
      // spatial dimensions of the array
      val m = c.p.m
      val n = c.p.n
      // latency from inputs changed to accumulate update
      val latency = c.p.getLatency()

      // helper fuctions for more concise tests
      // wait up to <latency> cycles with valid=0 to create pipeline bubbles
      def randomNoValidWait(max: Int = latency) = {
        val numNoValidCycles = r.nextInt(max + 1)
        poke(c.io.valid, 0)
        step(numNoValidCycles)
      }
      def clearAcc(waitUntilCleared: Boolean = false) = {
        // note that clearing happens right before the regular binary dot
        // product result is added -- so also set inputs explicitly to zero.
        // normally the testbench would just set the clear_acc of the very
        // first test vector to 1 alongside the regular data, and to 0 after,
        // but this also works.
        for (i_m ??? 0 to m - 1) { poke(c.io.a(i_m), 0) }
        for (i_n ??? 0 to n - 1) { poke(c.io.b(i_n), 0) }
        poke(c.io.clear_acc, 1)
        poke(c.io.valid, 1)
        step(1)
        poke(c.io.clear_acc, 0)
        poke(c.io.valid, 0)
        if(waitUntilCleared) {
          step(latency)
        }
      }

      for (i ??? 1 to num_seqs) {
        // generate two random int matrices a[m_test][k_test] and b[n_test][k_test] s.t.
        // m_test % m = 0, n_test % n = 0, k_test % pc_len = 0
        val seq_len = 2  //+r.nextInt(17) //to set the number of blocks to split
        val k_test = pc_len * seq_len     //pc_len???????????????????????????k??????????????????????????????  ??????vector????????? pc_len * seq_len ???  ???a ????????????????????????  ?????????b ????????????????????????
        // TODO add more m and n tiles, clear accumulator in between
        val m_test = m  //???a ????????????????????????
        val n_test = n  // 
        println("Set matrix left = "+m+" * "+k_test+"   Count in integer!!")
        println("Set matrix left = "+k_test+" * "+n+"   Count in integer!!")
        println("Matrix multiply block split size = "++" * "+pc_len+"   Count in integer!!")
        // precision in bits, each between 1 and max_shift/2 bits
        // such that their sum won't be greater than max_shift
        // ?????????????????? ??????int????????????????????????????????????????????????????????????????????????????????????
        val precA = 1 + 1//r.nextInt(max_shift / 2)
        val precB = 1 +2//r.nextInt(max_shift / 2)
        println("Bit width of elements(integer) in left matrix a = "+precA)
        println("Bit width of elements(integer) in right matrix b = "+precB)
        assert(precA + precB <= max_shift)
        // produce random binary test vectors and golden result
        //val negA = r.nextBoolean
        //val negB = r.nextBoolean
        val negA = false
        val negB = false
        // ??????a m*k ??????b k*n ??????b????????????????????????????????????-147???
        val a = BISMOTestHelpers.randomIntMatrix(m_test, k_test, precA, negA)
        val b = BISMOTestHelpers.randomIntMatrix(n_test, k_test, precB, negB)
        println("The maritx is generated")
        println("Matrix a ****** show in vector of each row!")
        println("a = "+a(0))
        println("a = "+a(1))
        println("a = "+a(2))
        println("Matrix a ****** show in vector of each col!!")
        println("b = "+b(0))
        println("b = "+b(1))
        println("b = "+b(2))
        val golden = BISMOTestHelpers.matrixProduct(a, b)
        println("Matrix a*b predicted result:")
        println("c = "+golden(0))
        // clear the accumulator
        clearAcc(true)
        // iterate over each combination of bit positions for bit serial
        for(slice <- precA + precB - 2 to 0 by -1) {  //??????????????????????????????precA-1+precB-1  slice???????????????
          val z1 = if(slice < precB) {0} else {slice - (precB - 1)}   //????????????????????????????????? (????????????????????????????????????)
          val z2 = if(slice < precA) {0} else {slice - (precA - 1)}   //?????????????????????????????????
          for(j <- slice - z2 to z1 by -1) {  //?????????????????????????????? ??????z1  ??????slice - z2
            val bitA = j
            val bitB = slice-j
            println("The bits LEFT matrix need shift = "+bitA)
            println("The bits RIGHT matrix need shift = "+bitB)
            val negbitA = negA & (bitA == precA-1)
            val negbitB = negB & (bitB == precB-1)
            val doNeg = if(negbitA ^ negbitB) 1 else 0
            // ????????????  ???????????????seq_len?????????  ????????????????????????????????????
            for(s <- 0 to seq_len-1) {
              poke(c.io.clear_acc, 0) //????????????
              poke(c.io.negate, doNeg)
              // ?????????????????????????????????flag?????????MAC???????????????????????????
              if(j == slice - z2 && s == 0) {
                // new wavefront
                // shift accumulator then accumulate
                poke(c.io.shiftAmount, 1)
              } else {
                // within same wavefront (sum of bit positions)
                // regular accumulate
                poke(c.io.shiftAmount, 0)
              }

              // insert stimulus for left-hand-side matrix tile
              for (i_m ??? 0 to m - 1) {
                val seqA_bs = BISMOTestHelpers.intVectorToBitSerial(a(i_m), precA)
                val curA = seqA_bs(bitA).slice(s * pc_len, (s + 1) * pc_len)
                poke(c.io.a(i_m), scala.math.BigInt.apply(curA.mkString, 2))
              }
              // insert stimulus for right-hand-side matrix tile
              for (i_n ??? 0 to n - 1) {
                val seqB_bs = BISMOTestHelpers.intVectorToBitSerial(b(i_n), precB)
                val curB = seqB_bs(bitB).slice(s * pc_len, (s + 1) * pc_len)
                poke(c.io.b(i_n), scala.math.BigInt.apply(curB.mkString, 2))
              }
              poke(c.io.valid, 1)
              step(1)
              // emulate random pipeline bubbles
              randomNoValidWait()
            }
          }
        }
        // remove valid input in next cycle
        poke(c.io.valid, 0)
        // wait until all inputs are processed
        step(latency - 1)
        // check produced matrix against golden result
        for (i_m ??? 0 to m - 1) {
          for (i_n ??? 0 to n - 1) {
            expect(c.io.out(i_m)(i_n), golden(i_m)(i_n))
          }
        }
      }
    }

    // Chisel arguments to pass to chiselMainTest
    def testArgs = BISMOTestHelpers.stdArgs
    // function that instantiates the Module to be tested
    val pDP = new DotProductUnitParams(32, 32)
    val p = new DotProductArrayParams(pDP, 3, 3, 0)
    def testModuleInstFxn = () ??? { Module(new DotProductArray(p)) }
    // function that instantiates the Tester to test the Module
    def testTesterInstFxn = (c: DotProductArray) ??? new DotProductArrayTester(c)

    // actually run the test
    chiselMainTest(
      testArgs,
      testModuleInstFxn
    ) {
        testTesterInstFxn
      }
  }
}

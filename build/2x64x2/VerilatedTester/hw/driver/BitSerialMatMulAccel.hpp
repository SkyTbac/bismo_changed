
#ifndef BitSerialMatMulAccel_H
#define BitSerialMatMulAccel_H
#include "wrapperregdriver.h"
#include <map>
#include <string>
#include <vector>

// template parameters used for instantiating TemplatedHLSBlackBoxes, if any:
#define TEMPLATE_PARAM_ADDR_UNIT 1
#define TEMPLATE_PARAM_OUT_ADDR_BITWIDTH 16
#define TEMPLATE_PARAM_CONSTANT_ADDRESS 0

#define TEMPLATE_PARAM_LMEM 8192
#define TEMPLATE_PARAM_RMEM 1024
#define TEMPLATE_PARAM_ETF_S 0

#define TEMPLATE_PARAM_LMEM 8192
#define TEMPLATE_PARAM_N 2
#define TEMPLATE_PARAM_M 2
#define TEMPLATE_PARAM_RMEM 1024
#define TEMPLATE_PARAM_K 64
#define TEMPLATE_PARAM_ETF_S 0

#define TEMPLATE_PARAM_M 2
#define TEMPLATE_PARAM_N 2
#define TEMPLATE_PARAM_A 32


using namespace std;
class BitSerialMatMulAccel {
public:
  BitSerialMatMulAccel(WrapperRegDriver * platform) {
    m_platform = platform;
    attach();
    if(readReg(0) != 0x8426730)  {
      throw "Unexpected accelerator signature, is the correct bitfile loaded?";
    }
  }
  ~BitSerialMatMulAccel() {
    detach();
  }

    AccelReg get_ackqueue_bits() {return readReg(1);} 
  void set_ackqueue_ready(AccelReg value) {writeReg(2, value);} 
  AccelReg get_ackqueue_valid() {return readReg(3);} 
  void set_addtoken_ef(AccelReg value) {writeReg(4, value);} 
  void set_addtoken_re(AccelReg value) {writeReg(5, value);} 
  void set_cmdqueue_bits_actualPrecision(AccelReg value) {writeReg(6, value);} 
  void set_cmdqueue_bits_dramBaseAddrDst(AccelReg value) {writeReg(7, value);} 
  void set_cmdqueue_bits_dramBaseAddrSrc(AccelReg value) {writeReg(8, value);} 
  void set_cmdqueue_bits_matrixColsGroup(AccelReg value) {writeReg(9, value);} 
  void set_cmdqueue_bits_matrixRows(AccelReg value) {writeReg(10, value);} 
  void set_cmdqueue_bits_signed(AccelReg value) {writeReg(11, value);} 
  void set_cmdqueue_bits_waitCompleteBytes(AccelReg value) {writeReg(12, value);} 
  AccelReg get_cmdqueue_ready() {return readReg(13);} 
  void set_cmdqueue_valid(AccelReg value) {writeReg(14, value);} 
  void set_dsc_bits0(AccelReg value) {writeReg(15, value);}
  void set_dsc_bits1(AccelReg value) {writeReg(16, value);}
  void set_dsc_bits2(AccelReg value) {writeReg(17, value);}
  void set_dsc_bits3(AccelReg value) {writeReg(18, value);}
  void set_dsc_bits4(AccelReg value) {writeReg(19, value);}
  void set_dsc_bits5(AccelReg value) {writeReg(20, value);}
  void set_dsc_bits6(AccelReg value) {writeReg(21, value);}

  AccelReg get_dsc_ready() {return readReg(22);} 
  void set_dsc_valid(AccelReg value) {writeReg(23, value);} 
  void set_enable(AccelReg value) {writeReg(24, value);} 
  void set_exec_enable(AccelReg value) {writeReg(25, value);} 
  AccelReg get_exec_op_count() {return readReg(26);} 
  void set_fetch_enable(AccelReg value) {writeReg(27, value);} 
  AccelReg get_fetch_op_count() {return readReg(28);} 
  AccelReg get_hw_accWidth() {return readReg(29);} 
  AccelReg get_hw_cmdQueueEntries() {return readReg(30);} 
  AccelReg get_hw_dpaDimCommon() {return readReg(31);} 
  AccelReg get_hw_dpaDimLHS() {return readReg(32);} 
  AccelReg get_hw_dpaDimRHS() {return readReg(33);} 
  AccelReg get_hw_lhsEntriesPerMem() {return readReg(34);} 
  AccelReg get_hw_maxShiftSteps() {return readReg(35);} 
  AccelReg get_hw_readChanWidth() {return readReg(36);} 
  AccelReg get_hw_rhsEntriesPerMem() {return readReg(37);} 
  AccelReg get_hw_writeChanWidth() {return readReg(38);} 
  void set_insOrDsc(AccelReg value) {writeReg(39, value);} 
  void set_ins_bits0(AccelReg value) {writeReg(40, value);}
  void set_ins_bits1(AccelReg value) {writeReg(41, value);}
  void set_ins_bits2(AccelReg value) {writeReg(42, value);}
  void set_ins_bits3(AccelReg value) {writeReg(43, value);}

  AccelReg get_ins_ready() {return readReg(44);} 
  void set_ins_valid(AccelReg value) {writeReg(45, value);} 
  AccelReg get_perf_cc() {return readReg(46);} 
  void set_perf_cc_enable(AccelReg value) {writeReg(47, value);} 
  AccelReg get_perf_prf_exec_count() {return readReg(48);} 
  void set_perf_prf_exec_sel(AccelReg value) {writeReg(49, value);} 
  AccelReg get_perf_prf_fetch_count() {return readReg(50);} 
  void set_perf_prf_fetch_sel(AccelReg value) {writeReg(51, value);} 
  AccelReg get_perf_prf_res_count() {return readReg(52);} 
  void set_perf_prf_res_sel(AccelReg value) {writeReg(53, value);} 
  void set_result_enable(AccelReg value) {writeReg(54, value);} 
  AccelReg get_result_op_count() {return readReg(55);} 
  AccelReg get_signature() {return readReg(0);} 
  AccelReg get_tc_ef() {return readReg(56);} 
  AccelReg get_tc_er() {return readReg(57);} 
  AccelReg get_tc_fe() {return readReg(58);} 
  AccelReg get_tc_re() {return readReg(59);} 


  map<string, vector<unsigned int>> getStatusRegs() {
    map<string, vector<unsigned int>> ret = { {"ackqueue_bits", {1}} ,  {"ackqueue_valid", {3}} ,  {"cmdqueue_ready", {13}} ,  {"dsc_ready", {22}} ,  {"exec_op_count", {26}} ,  {"fetch_op_count", {28}} ,  {"hw_accWidth", {29}} ,  {"hw_cmdQueueEntries", {30}} ,  {"hw_dpaDimCommon", {31}} ,  {"hw_dpaDimLHS", {32}} ,  {"hw_dpaDimRHS", {33}} ,  {"hw_lhsEntriesPerMem", {34}} ,  {"hw_maxShiftSteps", {35}} ,  {"hw_readChanWidth", {36}} ,  {"hw_rhsEntriesPerMem", {37}} ,  {"hw_writeChanWidth", {38}} ,  {"ins_ready", {44}} ,  {"perf_cc", {46}} ,  {"perf_prf_exec_count", {48}} ,  {"perf_prf_fetch_count", {50}} ,  {"perf_prf_res_count", {52}} ,  {"result_op_count", {55}} ,  {"signature", {0}} ,  {"tc_ef", {56}} ,  {"tc_er", {57}} ,  {"tc_fe", {58}} ,  {"tc_re", {59}} };
    return ret;
  }

  AccelReg readStatusReg(string regName) {
    map<string, vector<unsigned int>> statRegMap = getStatusRegs();
    if(statRegMap[regName].size() != 1) throw ">32 bit status regs are not yet supported from readStatusReg";
    return readReg(statRegMap[regName][0]);
  }

protected:
  WrapperRegDriver * m_platform;
  AccelReg readReg(unsigned int i) {return m_platform->readReg(i);}
  void writeReg(unsigned int i, AccelReg v) {m_platform->writeReg(i,v);}
  void attach() {m_platform->attach("BitSerialMatMulAccel");}
  void detach() {m_platform->detach();}
};
#endif
    
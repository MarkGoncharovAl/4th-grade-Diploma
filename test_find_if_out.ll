
LSR on loop %for.body.i.i.i:
  Change loop exiting icmp to use postinc iv:   cd
Collecting IV Chains.
IV Chain#0 Head: (  %__first.addr.0.val64.i.i.i = load i32, ptr %__first.addr.088.i.i.i, align 4) IV={%b,+,16}<nuw><%for.body.i.i.i>
IV Chain#0  Inc: (  %incdec.ptr.val.i.i.i = load i32, ptr %incdec.ptr.i.i.i, align 4) IV+4
IV Chain#0  Inc: (  %incdec.ptr5.val.i.i.i = load i32, ptr %incdec.ptr5.i.i.i, align 4) IV+4
IV Chain#0  Inc: (  %incdec.ptr9.val.i.i.i = load i32, ptr %incdec.ptr9.i.i.i, align 4) IV+4
IV Chain#1 Head: (  %cmp.i.i.i = icmp sgt i64 %__trip_count.089.i.i.i, 1) IV={(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16),+,-1}<nsw><%for.body.i.i.i>
IV Chain#1  Inc: (  %__trip_count.089.i.i.i = phi i64 [ %dec.i.i.i, %if.end12.i.i.i ], [ %shr.i.i.i, %for.body.preheader.i.i.i ]) IV+-1
IV Chain#0  Inc: (  %__first.addr.088.i.i.i = phi ptr [ %incdec.ptr13.i.i.i, %if.end12.i.i.i ], [ %b, %for.body.preheader.i.i.i ]) IV+4
Chain:   %__first.addr.0.val64.i.i.i = load i32, ptr %__first.addr.088.i.i.i, align 4 users:
    %retval.0.i.i.i = phi ptr [ %e, %sw.default.i.i.i ], [ %__first.addr.0.lcssa.i.i.i, %sw.bb.i.i.i ], [ %__first.addr.1.i.i.i, %sw.bb22.i.i.i ], [ %__first.addr.2.i.i.i, %sw.bb27.i.i.i ], [ %incdec.ptr.i.i.i.le, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit" ], [ %incdec.ptr5.i.i.i.le, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15" ], [ %incdec.ptr9.i.i.i.le, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17" ], [ %__first.addr.088.i.i.i, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit" ]
Chain:   %cmp.i.i.i = icmp sgt i64 %__trip_count.089.i.i.i, 1 Cost: 0
LSR has identified the following interesting factors and types: *-16, *16, *-1
LSR is examining the following fixup sites:
  UserInst=%cmp.i.i.i, OperandValToReplace=%__trip_count.089.i.i.i, PostIncLoop=%for.body.i.i.i
  UserInst=%retval.0.i.i.i, OperandValToReplace=%__first.addr.088.i.i.i
  UserInst=%__first.addr.0.lcssa.i.i.i, OperandValToReplace=%incdec.ptr13.i.i.i, PostIncLoop=%for.body.i.i.i
  UserInst=%retval.0.i.i.i, OperandValToReplace=%incdec.ptr9.i.i.i.le
  UserInst=%retval.0.i.i.i, OperandValToReplace=%incdec.ptr5.i.i.i.le
  UserInst=%retval.0.i.i.i, OperandValToReplace=%incdec.ptr.i.i.i.le
  UserInst=%sub.ptr.sub16.pre-phi.i.i.i, OperandValToReplace=%.pre94.i.i.i, PostIncLoop=%for.body.i.i.i
  UserInst=%incdec.ptr9.val.i.i.i, OperandValToReplace=%incdec.ptr9.i.i.i
  UserInst=%incdec.ptr5.val.i.i.i, OperandValToReplace=%incdec.ptr5.i.i.i
  UserInst=%incdec.ptr.val.i.i.i, OperandValToReplace=%incdec.ptr.i.i.i
  UserInst=%__first.addr.0.val64.i.i.i, OperandValToReplace=%__first.addr.088.i.i.i
LSR found 10 uses:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Basic, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
  LSR Use: Kind=Basic, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Basic, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Basic, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Basic, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
Generating cross-use offsets for {(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16),+,-1}<nsw><%for.body.i.i.i>: 0 1
Skipping cross-use reuse for {(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16),+,-1}<nsw><%for.body.i.i.i>
Skipping cross-use reuse for {(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>
Generating cross-use offsets for {%b,+,16}<nuw><%for.body.i.i.i>: 0 4 8 12
Generating cross-use offsets for {0,+,-1}<%for.body.i.i.i>: 0 1
Skipping cross-use reuse for {0,+,-1}<%for.body.i.i.i>
Skipping cross-use reuse for {1,+,-1}<%for.body.i.i.i>
Generating cross-use offsets for (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16): 0 1
Skipping cross-use reuse for (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16)
Skipping cross-use reuse for (1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>
Generating cross-use offsets for {0,+,16}<%for.body.i.i.i>: 0 4 8 12
Generating cross-use offsets for %b: 0 4 8 12
Generating cross-use offsets for {0,+,-16}<%for.body.i.i.i>: -12 -8 -4 0

After generating reuse formulae:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
    reg({(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16),+,-1}<nsw><%for.body.i.i.i>) + imm(1)
    reg((((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16)) + 1*reg({0,+,-1}<%for.body.i.i.i>) + imm(1)
    reg((((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16)) + 1*reg({1,+,-1}<%for.body.i.i.i>)
    reg((1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>) + 1*reg({0,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-12)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + -1*reg({-12,+,-16}<%for.body.i.i.i>)
    reg((12 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + -1*reg({-8,+,-16}<%for.body.i.i.i>)
    reg((8 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({-4,+,-16}<%for.body.i.i.i>)
    reg((4 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
    reg((-1 * (ptrtoint ptr %b to i64))) + 1*reg({(ptrtoint ptr %e to i64),+,-16}<%for.body.i.i.i>)
    reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    reg((ptrtoint ptr %e to i64)) + 1*reg({(-1 * (ptrtoint ptr %b to i64)),+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    -1*reg({((-1 * (ptrtoint ptr %e to i64)) + (ptrtoint ptr %b to i64)),+,16}<%for.body.i.i.i>)
    reg((-1 * (ptrtoint ptr %b to i64))) + -1*reg({(-1 * (ptrtoint ptr %e to i64)),+,16}<%for.body.i.i.i>)
    reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + -1*reg({0,+,16}<%for.body.i.i.i>)
    reg((ptrtoint ptr %e to i64)) + -1*reg({(ptrtoint ptr %b to i64),+,16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
    reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    12 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    4 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    8 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -4 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    4 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -8 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    -4 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    -12 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    -8 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
Filtering for use LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
  Filtering out formula reg({(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16),+,-1}<nsw><%for.body.i.i.i>) + imm(1)
    in favor of formula reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  Filtering out formula reg((1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>) + 1*reg({0,+,-1}<%for.body.i.i.i>)
    in favor of formula reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  Filtering out formula reg((((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16)) + 1*reg({1,+,-1}<%for.body.i.i.i>)
    in favor of formula reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  Filtering out formula reg((((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16)) + 1*reg({0,+,-1}<%for.body.i.i.i>) + imm(1)
    in favor of formula reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
Filtering for use LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
  Filtering out formula reg((-1 * (ptrtoint ptr %b to i64))) + 1*reg({(ptrtoint ptr %e to i64),+,-16}<%for.body.i.i.i>)
    in favor of formula reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
  Filtering out formula reg((ptrtoint ptr %e to i64)) + 1*reg({(-1 * (ptrtoint ptr %b to i64)),+,-16}<%for.body.i.i.i>)
    in favor of formula reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
  Filtering out formula reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    in favor of formula reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
  Filtering out formula reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    in favor of formula reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
  Filtering out formula reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    in favor of formula reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
  Filtering out formula -1*reg({((-1 * (ptrtoint ptr %e to i64)) + (ptrtoint ptr %b to i64)),+,16}<%for.body.i.i.i>)
    in favor of formula reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
  Filtering out formula reg((ptrtoint ptr %e to i64)) + -1*reg({(ptrtoint ptr %b to i64),+,16}<%for.body.i.i.i>)
    in favor of formula reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
  Filtering out formula reg((-1 * (ptrtoint ptr %b to i64))) + reg((ptrtoint ptr %e to i64)) + -1*reg({0,+,16}<%for.body.i.i.i>)
    in favor of formula reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
  Filtering out formula reg((-1 * (ptrtoint ptr %b to i64))) + -1*reg({(-1 * (ptrtoint ptr %e to i64)),+,16}<%for.body.i.i.i>)
    in favor of formula reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
Filtering for use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
Filtering for use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
Filtering for use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
Filtering for use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr

After filtering out undesirable candidates:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-12)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + -1*reg({-12,+,-16}<%for.body.i.i.i>)
    reg((12 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + -1*reg({-8,+,-16}<%for.body.i.i.i>)
    reg((8 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({-4,+,-16}<%for.body.i.i.i>)
    reg((4 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    12 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    4 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    8 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -4 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    4 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -8 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    -4 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    -12 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    -8 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
The search space is too complex.
Narrowing the search space by eliminating formulae which use a superset of registers used by other formulae.
After pre-selection:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-12)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + -1*reg({-12,+,-16}<%for.body.i.i.i>)
    reg((12 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + -1*reg({-8,+,-16}<%for.body.i.i.i>)
    reg((8 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({-4,+,-16}<%for.body.i.i.i>)
    reg((4 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    12 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    4 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    8 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -4 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    4 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -8 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    -4 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    -12 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    -8 + reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
The search space is too complex.
Narrowing the search space by assuming that uses separated by a constant offset will use the same registers.
  Deleting use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
New fixup has offset 12
  Deleting use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,12}, widest fixup type: ptr
New fixup has offset -8
New fixup has offset 4
  Deleting use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0}, widest fixup type: ptr
New fixup has offset -4
After pre-selection:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-12)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + -1*reg({-12,+,-16}<%for.body.i.i.i>)
    reg((12 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + -1*reg({-8,+,-16}<%for.body.i.i.i>)
    reg((8 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({-4,+,-16}<%for.body.i.i.i>)
    reg((4 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,-8,4,-4}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    8 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -4 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
The search space is too complex.
Narrowing the search space by re-filtering out undesirable dedicated registers.
Filtering for use LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
Filtering for use LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
Filtering for use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,-8,4,-4}, widest fixup type: ptr
After pre-selection:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-12)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + -1*reg({-12,+,-16}<%for.body.i.i.i>)
    reg((12 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + -1*reg({-8,+,-16}<%for.body.i.i.i>)
    reg((8 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({-4,+,-16}<%for.body.i.i.i>)
    reg((4 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,-8,4,-4}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    8 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
    -4 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
The search space is too complex.
Narrowing the search space by choosing the best Formula from the Formulae with the same Scale and ScaledReg.
Filtering for use LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
Filtering for use LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
  Filtering out formula reg((12 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
  Filtering out formula reg((12 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
  Filtering out formula reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
  Filtering out formula reg((8 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
  Filtering out formula reg((4 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
  Filtering out formula reg((4 + %b)) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
Filtering for use LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
Filtering for use LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,-8,4,-4}, widest fixup type: ptr
  Filtering out formula reg((8 + %b)) + 1*reg({0,+,16}<%for.body.i.i.i>)
    in favor of formula reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)

After filtering out undesirable candidates:
LSR is examining the following uses:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({%b,+,16}<nuw><%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-12)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + 1*reg({12,+,16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(%b) + -1*reg({-12,+,-16}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(8)
    reg(%b) + -1*reg({-8,+,-16}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(4 + %b),+,16}<nw><%for.body.i.i.i>)
    reg({%b,+,16}<nuw><%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + 1*reg({4,+,16}<%for.body.i.i.i>)
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
    reg(%b) + -1*reg({0,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(%b) + -1*reg({-4,+,-16}<%for.body.i.i.i>)
    reg({(12 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-4,+,-16}<%for.body.i.i.i>) + imm(4)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({0,+,-16}<%for.body.i.i.i>)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + 1*reg({-12,+,-16}<%for.body.i.i.i>) + imm(12)
    reg(((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64))) + -1*reg({0,+,16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,-8,4,-4}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
    reg(%b) + 1*reg({8,+,16}<%for.body.i.i.i>)
    reg(%b) + 1*reg({0,+,16}<%for.body.i.i.i>) + imm(8)
    -4 + reg({(12 + %b),+,16}<nw><%for.body.i.i.i>)
    8 + reg({%b,+,16}<nuw><%for.body.i.i.i>)
New best at 6 instructions 3 regs, with addrec cost 3, plus 3 base adds, plus 14 imm cost, plus 5 setup cost.
Regs:
- {(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>
- {%b,+,16}<nuw><%for.body.i.i.i>
- {((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>

New best at 6 instructions 3 regs, with addrec cost 3, plus 3 base adds, plus 12 imm cost, plus 6 setup cost.
Regs:
- {(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>
- {(12 + %b),+,16}<nw><%for.body.i.i.i>
- {((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>

New best at 6 instructions 3 regs, with addrec cost 3, plus 3 base adds, plus 11 imm cost, plus 6 setup cost.
Regs:
- {(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>
- {(8 + %b),+,16}<nw><%for.body.i.i.i>
- {((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>


The chosen solution requires 6 instructions 3 regs, with addrec cost 3, plus 3 base adds, plus 11 imm cost, plus 6 setup cost:
  LSR Use: Kind=Basic, Offsets={0}, widest fixup type: i64
    reg({(1 + (((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)) /u 16))<nuw><nsw>,+,-1}<%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0,0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-8)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>) + imm(-4)
  LSR Use: Kind=Special, Offsets={0}, all-fixups-outside-loop, widest fixup type: i64
    reg({((-1 * (ptrtoint ptr %b to i64)) + (ptrtoint ptr %e to i64)),+,-16}<%for.body.i.i.i>)
  LSR Use: Kind=Address of i32 in addrspace(0), Offsets={0,-8,4,-4}, widest fixup type: ptr
    reg({(8 + %b),+,16}<nw><%for.body.i.i.i>)
; ModuleID = 'test_find_if.ll'
source_filename = "ex1.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64"

define dso_local noundef signext i32 @_Z3fooPiS_i(ptr noundef %b, ptr noundef %e, i32 noundef signext %a) {
entry:
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %e to i64
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %b to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %cmp87.i.i.i = icmp sgt i64 %sub.ptr.sub.i.i.i, 15
  br i1 %cmp87.i.i.i, label %for.body.preheader.i.i.i, label %for.end.i.i.i

for.body.preheader.i.i.i:                         ; preds = %entry
  %shr.i.i.i = lshr i64 %sub.ptr.sub.i.i.i, 4
  %0 = add nuw nsw i64 %shr.i.i.i, 1
  %uglygep = getelementptr i8, ptr %b, i64 8
  br label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %if.end12.i.i.i, %for.body.preheader.i.i.i
  %lsr.iv7 = phi i64 [ %lsr.iv.next8, %if.end12.i.i.i ], [ %sub.ptr.sub.i.i.i, %for.body.preheader.i.i.i ]
  %lsr.iv1 = phi ptr [ %uglygep2, %if.end12.i.i.i ], [ %uglygep, %for.body.preheader.i.i.i ]
  %lsr.iv = phi i64 [ %lsr.iv.next, %if.end12.i.i.i ], [ %0, %for.body.preheader.i.i.i ]
  %uglygep9 = getelementptr i8, ptr %lsr.iv1, i64 -8
  %__first.addr.0.val64.i.i.i = load i32, ptr %uglygep9, align 4
  %cmp.i.i.i.i.i = icmp eq i32 %__first.addr.0.val64.i.i.i, %a
  br i1 %cmp.i.i.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit", label %if.end.i.i.i

if.end.i.i.i:                                     ; preds = %for.body.i.i.i
  %uglygep11 = getelementptr i8, ptr %lsr.iv1, i64 -4
  %incdec.ptr.val.i.i.i = load i32, ptr %uglygep11, align 4
  %cmp.i.i65.i.i.i = icmp eq i32 %incdec.ptr.val.i.i.i, %a
  br i1 %cmp.i.i65.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit", label %if.end4.i.i.i

if.end4.i.i.i:                                    ; preds = %if.end.i.i.i
  %incdec.ptr5.val.i.i.i = load i32, ptr %lsr.iv1, align 4
  %cmp.i.i66.i.i.i = icmp eq i32 %incdec.ptr5.val.i.i.i, %a
  br i1 %cmp.i.i66.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15", label %if.end8.i.i.i

if.end8.i.i.i:                                    ; preds = %if.end4.i.i.i
  %uglygep10 = getelementptr i8, ptr %lsr.iv1, i64 4
  %incdec.ptr9.val.i.i.i = load i32, ptr %uglygep10, align 4
  %cmp.i.i67.i.i.i = icmp eq i32 %incdec.ptr9.val.i.i.i, %a
  br i1 %cmp.i.i67.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17", label %if.end12.i.i.i

if.end12.i.i.i:                                   ; preds = %if.end8.i.i.i
  %lsr.iv.next = add nsw i64 %lsr.iv, -1
  %uglygep2 = getelementptr i8, ptr %lsr.iv1, i64 16
  %lsr.iv.next8 = add i64 %lsr.iv7, -16
  %cmp.i.i.i = icmp sgt i64 %lsr.iv.next, 1
  br i1 %cmp.i.i.i, label %for.body.i.i.i, label %for.end.loopexit.i.i.i

for.end.loopexit.i.i.i:                           ; preds = %if.end12.i.i.i
  %uglygep4 = getelementptr i8, ptr %uglygep2, i64 -8
  br label %for.end.i.i.i

for.end.i.i.i:                                    ; preds = %for.end.loopexit.i.i.i, %entry
  %sub.ptr.sub16.pre-phi.i.i.i = phi i64 [ %lsr.iv.next8, %for.end.loopexit.i.i.i ], [ %sub.ptr.sub.i.i.i, %entry ]
  %__first.addr.0.lcssa.i.i.i = phi ptr [ %uglygep4, %for.end.loopexit.i.i.i ], [ %b, %entry ]
  %sub.ptr.div17.i.i.i = ashr exact i64 %sub.ptr.sub16.pre-phi.i.i.i, 2
  switch i64 %sub.ptr.div17.i.i.i, label %sw.default.i.i.i [
    i64 3, label %sw.bb.i.i.i
    i64 2, label %sw.bb22.i.i.i
    i64 1, label %sw.bb27.i.i.i
  ]

sw.bb.i.i.i:                                      ; preds = %for.end.i.i.i
  %__first.addr.0.val.i.i.i = load i32, ptr %__first.addr.0.lcssa.i.i.i, align 4
  %cmp.i.i68.i.i.i = icmp eq i32 %__first.addr.0.val.i.i.i, %a
  br i1 %cmp.i.i68.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit", label %if.end20.i.i.i

if.end20.i.i.i:                                   ; preds = %sw.bb.i.i.i
  %incdec.ptr21.i.i.i = getelementptr inbounds i32, ptr %__first.addr.0.lcssa.i.i.i, i64 1
  br label %sw.bb22.i.i.i

sw.bb22.i.i.i:                                    ; preds = %if.end20.i.i.i, %for.end.i.i.i
  %__first.addr.1.i.i.i = phi ptr [ %__first.addr.0.lcssa.i.i.i, %for.end.i.i.i ], [ %incdec.ptr21.i.i.i, %if.end20.i.i.i ]
  %__first.addr.1.val.i.i.i = load i32, ptr %__first.addr.1.i.i.i, align 4
  %cmp.i.i69.i.i.i = icmp eq i32 %__first.addr.1.val.i.i.i, %a
  br i1 %cmp.i.i69.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit", label %if.end25.i.i.i

if.end25.i.i.i:                                   ; preds = %sw.bb22.i.i.i
  %incdec.ptr26.i.i.i = getelementptr inbounds i32, ptr %__first.addr.1.i.i.i, i64 1
  br label %sw.bb27.i.i.i

sw.bb27.i.i.i:                                    ; preds = %if.end25.i.i.i, %for.end.i.i.i
  %__first.addr.2.i.i.i = phi ptr [ %__first.addr.0.lcssa.i.i.i, %for.end.i.i.i ], [ %incdec.ptr26.i.i.i, %if.end25.i.i.i ]
  %__first.addr.2.val.i.i.i = load i32, ptr %__first.addr.2.i.i.i, align 4
  %cmp.i.i70.i.i.i = icmp eq i32 %__first.addr.2.val.i.i.i, %a
  br i1 %cmp.i.i70.i.i.i, label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit", label %sw.default.i.i.i

sw.default.i.i.i:                                 ; preds = %sw.bb27.i.i.i, %for.end.i.i.i
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit": ; preds = %if.end.i.i.i
  %uglygep6 = getelementptr i8, ptr %lsr.iv1, i64 -4
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15": ; preds = %if.end4.i.i.i
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17": ; preds = %if.end8.i.i.i
  %uglygep5 = getelementptr i8, ptr %lsr.iv1, i64 4
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit": ; preds = %for.body.i.i.i
  %uglygep3 = getelementptr i8, ptr %lsr.iv1, i64 -8
  br label %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit"

"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit": ; preds = %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit", %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17", %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15", %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit", %sw.default.i.i.i, %sw.bb27.i.i.i, %sw.bb22.i.i.i, %sw.bb.i.i.i
  %retval.0.i.i.i = phi ptr [ %e, %sw.default.i.i.i ], [ %__first.addr.0.lcssa.i.i.i, %sw.bb.i.i.i ], [ %__first.addr.1.i.i.i, %sw.bb22.i.i.i ], [ %__first.addr.2.i.i.i, %sw.bb27.i.i.i ], [ %uglygep6, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit" ], [ %lsr.iv1, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit15" ], [ %uglygep5, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit.split.loop.exit17" ], [ %uglygep3, %"_ZSt7find_ifIPiZ3fooS0_S0_iE3$_0ET_S2_S2_T0_.exit.loopexit" ]
  %cmp.not = icmp eq ptr %retval.0.i.i.i, %e
  %.a = select i1 %cmp.not, i32 0, i32 %a
  ret i32 %.a
}

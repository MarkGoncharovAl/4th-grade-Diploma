; ModuleID = 'extra.ll'
source_filename = "extra.ll"
target datalayout = "e-p:32:32:32-n32"

declare void @foo(ptr)

define void @iv_start_non_preheader(ptr %mark, i32 signext %length) {
entry:
  %tobool.not3 = icmp eq i32 %length, 0
  br i1 %tobool.not3, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.05 = phi i32 [ %dec, %for.body ], [ %length, %for.body.preheader ]
  %dst.04 = phi ptr [ %incdec.ptr, %for.body ], [ %mark, %for.body.preheader ]
  %0 = load ptr, ptr %dst.04, align 8
  %1 = call ptr @foo(ptr %0)
  %incdec.ptr = getelementptr inbounds ptr, ptr %dst.04, i64 1
  %dec = add i32 %i.05, -1
  %tobool.not = icmp eq i32 %dec, 0
  br i1 %tobool.not, label %for.cond.cleanup.loopexit, label %for.body
}

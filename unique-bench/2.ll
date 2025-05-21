; ModuleID = './vectorize-testcases/unique-bench/2.c'
source_filename = "./vectorize-testcases/unique-bench/2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@haystack = dso_local global [1024 x i32] zeroinitializer, align 16
@B = dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16
@needles = dso_local local_unnamed_addr global [1024 x i32] zeroinitializer, align 16

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local i32 @ext(i32 noundef %k, ptr nocapture noundef %arr) local_unnamed_addr #0 {
entry:
  %retval.1.eli = alloca i32, align 4
  %indvars.iv26.eli = alloca i64, align 8
  %split.eli = alloca i64, align 8
  %indvars.iv27.eli = alloca i64, align 8
  %arrayidx28.eli = alloca ptr, align 8
  %.eli = alloca i32, align 4
  %0 = load i32, ptr %arr, align 4, !tbaa !5
  %cmp125 = icmp eq i32 %0, %k
  store i64 0, ptr %indvars.iv26.eli, align 8
  br i1 %cmp125, label %cleanup, label %if.else.lr.ph

if.else.lr.ph:                                    ; preds = %entry
  store i32 %0, ptr %.eli, align 4
  store ptr %arr, ptr %arrayidx28.eli, align 8
  store i64 0, ptr %indvars.iv27.eli, align 8
  br label %if.else

if.else:                                          ; preds = %if.else.lr.ph, %if.else.for.body_crit_edge
  %.load = load i32, ptr %.eli, align 4
  %arrayidx28.load = load ptr, ptr %arrayidx28.eli, align 8
  %indvars.iv27.load = load i64, ptr %indvars.iv27.eli, align 8
  %add = add nsw i32 %.load, 1
  store i32 %add, ptr %arrayidx28.load, align 4, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv27.load, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1024
  br i1 %exitcond.not, label %for.end, label %if.else.for.body_crit_edge, !llvm.loop !9

if.else.for.body_crit_edge:                       ; preds = %if.else
  %arrayidx = getelementptr inbounds i32, ptr %arr, i64 %indvars.iv.next
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %cmp1 = icmp eq i32 %1, %k
  store i32 %1, ptr %.eli, align 4
  store ptr %arrayidx, ptr %arrayidx28.eli, align 8
  store i64 %indvars.iv.next, ptr %indvars.iv27.eli, align 8
  store i64 %indvars.iv.next, ptr %split.eli, align 8
  br i1 %cmp1, label %for.body.cleanup_crit_edge, label %if.else

for.body.cleanup_crit_edge:                       ; preds = %if.else.for.body_crit_edge
  %split.load = load i64, ptr %split.eli, align 8
  store i64 %split.load, ptr %indvars.iv26.eli, align 8
  br label %cleanup

cleanup:                                          ; preds = %for.body.cleanup_crit_edge, %entry
  %indvars.iv26.load = load i64, ptr %indvars.iv26.eli, align 8
  %2 = trunc i64 %indvars.iv26.load to i32
  %mul = shl nuw nsw i32 %2, 1
  store i32 %mul, ptr %retval.1.eli, align 4
  br label %return

for.end:                                          ; preds = %if.else
  %idxprom4 = sext i32 %k to i64
  %arrayidx5 = getelementptr inbounds i32, ptr %arr, i64 %idxprom4
  %3 = load i32, ptr %arrayidx5, align 4, !tbaa !5
  store i32 %3, ptr %retval.1.eli, align 4
  br label %return

return:                                           ; preds = %cleanup, %for.end
  %retval.1.load = load i32, ptr %retval.1.eli, align 4
  ret i32 %retval.1.load
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @func() local_unnamed_addr #1 {
entry:
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.inc
  ret i32 undef

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds [1024 x i32], ptr @A, i64 0, i64 %indvars.iv
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %cmp1 = icmp sgt i32 %0, 0
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %1 = trunc i64 %indvars.iv to i32
  %call = tail call i32 @ext(i32 noundef %1, ptr noundef nonnull @haystack)
  %arrayidx3 = getelementptr inbounds [1024 x i32], ptr @B, i64 0, i64 %indvars.iv
  store i32 %call, ptr %arrayidx3, align 4, !tbaa !5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1024
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !12
}

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 18.1.0rc (https://github.com/llvm/llvm-project.git 461274b81d8641eab64d494accddc81d7db8a09e)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
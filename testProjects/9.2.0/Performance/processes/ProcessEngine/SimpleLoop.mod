[Ivy]
17273CC5183C042A 9.2.0 #module
>Proto >Proto Collection #zClass
Sp0 SimpleLoop Big #zClass
Sp0 B #cInfo
Sp0 #process
Sp0 @TextInP .type .type #zField
Sp0 @TextInP .processKind .processKind #zField
Sp0 @AnnotationInP-0n ai ai #zField
Sp0 @MessageFlowInP-0n messageIn messageIn #zField
Sp0 @MessageFlowOutP-0n messageOut messageOut #zField
Sp0 @TextInP .xml .xml #zField
Sp0 @TextInP .responsibility .responsibility #zField
Sp0 @StartRequest f0 '' #zField
Sp0 @EndTask f1 '' #zField
Sp0 @Alternative f3 '' #zField
Sp0 @PushWFArc f2 '' #zField
Sp0 @GridStep f5 '' #zField
Sp0 @PushWFArc f6 '' #zField
Sp0 @PushWFArc f4 '' #zField
Sp0 @PushWFArc f7 '' #zField
>Proto Sp0 Sp0 SimpleLoop #zField
Sp0 f0 outLink start.ivp #txt
Sp0 f0 inParamDecl '<> param;' #txt
Sp0 f0 inParamTable 'out.counter=500;
' #txt
Sp0 f0 requestEnabled true #txt
Sp0 f0 triggerEnabled false #txt
Sp0 f0 callSignature start() #txt
Sp0 f0 persist false #txt
Sp0 f0 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Sp0 f0 caseData businessCase.attach=true #txt
Sp0 f0 showInStartList 1 #txt
Sp0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
Sp0 f0 @C|.responsibility Everybody #txt
Sp0 f0 81 81 30 30 -21 17 #rect
Sp0 f1 433 81 30 30 0 15 #rect
Sp0 f3 336 80 32 32 0 16 #rect
Sp0 f2 expr in #txt
Sp0 f2 outCond 'in.counter <= 0' #txt
Sp0 f2 368 96 433 96 #arcP
Sp0 f5 actionTable 'out=in;
out.counter=in.counter - 1;
' #txt
Sp0 f5 168 74 112 44 0 -8 #rect
Sp0 f6 expr out #txt
Sp0 f6 111 96 168 96 #arcP
Sp0 f4 expr out #txt
Sp0 f4 280 96 336 96 #arcP
Sp0 f7 expr in #txt
Sp0 f7 352 80 224 74 #arcP
Sp0 f7 1 352 48 #addKink
Sp0 f7 2 224 48 #addKink
Sp0 f7 1 0.5884900859546556 0 0 #arcLabel
>Proto Sp0 .type performance.SimpleLoop #txt
>Proto Sp0 .processKind NORMAL #txt
>Proto Sp0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Sp0 0 0 32 24 18 0 #rect
>Proto Sp0 @|BIcon #fIcon
Sp0 f3 out f2 tail #connect
Sp0 f2 head f1 mainIn #connect
Sp0 f0 mainOut f6 tail #connect
Sp0 f6 head f5 mainIn #connect
Sp0 f5 mainOut f4 tail #connect
Sp0 f4 head f3 in #connect
Sp0 f3 out f7 tail #connect
Sp0 f7 head f5 mainIn #connect

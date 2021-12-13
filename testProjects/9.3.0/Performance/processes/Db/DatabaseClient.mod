[Ivy]
17297CB96C670B79 9.3.1 #module
>Proto >Proto Collection #zClass
Dt0 DatabaseClient Big #zClass
Dt0 B #cInfo
Dt0 #process
Dt0 @TextInP .type .type #zField
Dt0 @TextInP .processKind .processKind #zField
Dt0 @AnnotationInP-0n ai ai #zField
Dt0 @MessageFlowInP-0n messageIn messageIn #zField
Dt0 @MessageFlowOutP-0n messageOut messageOut #zField
Dt0 @TextInP .xml .xml #zField
Dt0 @TextInP .responsibility .responsibility #zField
Dt0 @StartRequest f0 '' #zField
Dt0 @EndTask f1 '' #zField
Dt0 @DBStep f3 '' #zField
Dt0 @PushWFArc f4 '' #zField
Dt0 @PushWFArc f2 '' #zField
>Proto Dt0 Dt0 DatabaseClient #zField
Dt0 f0 outLink element.ivp #txt
Dt0 f0 inParamDecl '<> param;' #txt
Dt0 f0 requestEnabled true #txt
Dt0 f0 triggerEnabled false #txt
Dt0 f0 callSignature element() #txt
Dt0 f0 persist false #txt
Dt0 f0 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Dt0 f0 caseData businessCase.attach=true #txt
Dt0 f0 showInStartList 1 #txt
Dt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>element.ivp</name>
    </language>
</elementInfo>
' #txt
Dt0 f0 @C|.responsibility Everybody #txt
Dt0 f0 81 49 30 30 -31 17 #rect
Dt0 f1 337 49 30 30 0 15 #rect
Dt0 f3 actionDecl 'performance.db.DbData out;
' #txt
Dt0 f3 actionTable 'out=in;
out.recordset=recordset;
' #txt
Dt0 f3 dbSql '<?xml version=""1.0"" standalone=""no""?>
<!DOCTYPE SELECT SYSTEM  ""sqlStatements.dtd"">
<SELECT><Table name=''IWA_PERMISSION''/></SELECT>' #txt
Dt0 f3 dbUrl SystemDatabase #txt
Dt0 f3 lotSize 2147483647 #txt
Dt0 f3 startIdx 0 #txt
Dt0 f3 type performance.db.DbData #txt
Dt0 f3 168 42 112 44 0 -8 #rect
Dt0 f4 expr out #txt
Dt0 f4 111 64 168 64 #arcP
Dt0 f2 expr out #txt
Dt0 f2 280 64 337 64 #arcP
>Proto Dt0 .type performance.db.DbData #txt
>Proto Dt0 .processKind NORMAL #txt
>Proto Dt0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Dt0 0 0 32 24 18 0 #rect
>Proto Dt0 @|BIcon #fIcon
Dt0 f0 mainOut f4 tail #connect
Dt0 f4 head f3 mainIn #connect
Dt0 f3 mainOut f2 tail #connect
Dt0 f2 head f1 mainIn #connect

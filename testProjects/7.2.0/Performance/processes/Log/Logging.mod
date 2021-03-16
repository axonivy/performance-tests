[Ivy]
17491D197ECC2DB6 3.23 #module
>Proto >Proto Collection #zClass
Lg0 Logging Big #zClass
Lg0 B #cInfo
Lg0 #process
Lg0 @TextInP .resExport .resExport #zField
Lg0 @TextInP .type .type #zField
Lg0 @TextInP .processKind .processKind #zField
Lg0 @AnnotationInP-0n ai ai #zField
Lg0 @MessageFlowInP-0n messageIn messageIn #zField
Lg0 @MessageFlowOutP-0n messageOut messageOut #zField
Lg0 @TextInP .xml .xml #zField
Lg0 @TextInP .responsibility .responsibility #zField
Lg0 @StartRequest f0 '' #zField
Lg0 @EndTask f1 '' #zField
Lg0 @GridStep f3 '' #zField
Lg0 @PushWFArc f4 '' #zField
Lg0 @PushWFArc f2 '' #zField
Lg0 @EndTask f5 '' #zField
Lg0 @GridStep f6 '' #zField
Lg0 @StartRequest f7 '' #zField
Lg0 @PushWFArc f8 '' #zField
Lg0 @PushWFArc f9 '' #zField
>Proto Lg0 Lg0 Logging #zField
Lg0 f0 outLink logErrors.ivp #txt
Lg0 f0 type performance.Data #txt
Lg0 f0 inParamDecl '<> param;' #txt
Lg0 f0 actionDecl 'performance.Data out;
' #txt
Lg0 f0 guid 17491D197FC8D7AB #txt
Lg0 f0 requestEnabled true #txt
Lg0 f0 triggerEnabled false #txt
Lg0 f0 callSignature logErrors() #txt
Lg0 f0 persist false #txt
Lg0 f0 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
Lg0 f0 caseData businessCase.attach=true #txt
Lg0 f0 showInStartList 1 #txt
Lg0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>logErrors.ivp</name>
    </language>
</elementInfo>
' #txt
Lg0 f0 @C|.responsibility Everybody #txt
Lg0 f0 81 49 30 30 -25 17 #rect
Lg0 f0 @|StartRequestIcon #fIcon
Lg0 f1 type performance.Data #txt
Lg0 f1 337 49 30 30 0 15 #rect
Lg0 f1 @|EndIcon #fIcon
Lg0 f3 actionDecl 'performance.Data out;
' #txt
Lg0 f3 actionTable 'out=in;
' #txt
Lg0 f3 actionCode 'import performance.log.LogGenerator;
LogGenerator.logErrors();' #txt
Lg0 f3 type performance.Data #txt
Lg0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>log errors</name>
    </language>
</elementInfo>
' #txt
Lg0 f3 168 42 112 44 -30 -7 #rect
Lg0 f3 @|StepIcon #fIcon
Lg0 f4 expr out #txt
Lg0 f4 111 64 168 64 #arcP
Lg0 f2 expr out #txt
Lg0 f2 280 64 337 64 #arcP
Lg0 f5 type performance.Data #txt
Lg0 f5 329 137 30 30 0 15 #rect
Lg0 f5 @|EndIcon #fIcon
Lg0 f6 actionDecl 'performance.Data out;
' #txt
Lg0 f6 actionTable 'out=in;
' #txt
Lg0 f6 actionCode 'import performance.log.LogGenerator;
LogGenerator.logDebugs();' #txt
Lg0 f6 type performance.Data #txt
Lg0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>log debugs</name>
    </language>
</elementInfo>
' #txt
Lg0 f6 168 130 112 44 -35 -7 #rect
Lg0 f6 @|StepIcon #fIcon
Lg0 f7 outLink logDebug.ivp #txt
Lg0 f7 type performance.Data #txt
Lg0 f7 inParamDecl '<> param;' #txt
Lg0 f7 actionDecl 'performance.Data out;
' #txt
Lg0 f7 guid 17491DB5A48CBCCA #txt
Lg0 f7 requestEnabled true #txt
Lg0 f7 triggerEnabled false #txt
Lg0 f7 callSignature logDebug() #txt
Lg0 f7 persist false #txt
Lg0 f7 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
Lg0 f7 caseData businessCase.attach=true #txt
Lg0 f7 showInStartList 1 #txt
Lg0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>logDebug.ivp</name>
    </language>
</elementInfo>
' #txt
Lg0 f7 @C|.responsibility Everybody #txt
Lg0 f7 73 137 30 30 -25 17 #rect
Lg0 f7 @|StartRequestIcon #fIcon
Lg0 f8 expr out #txt
Lg0 f8 280 152 329 152 #arcP
Lg0 f9 expr out #txt
Lg0 f9 103 152 168 152 #arcP
>Proto Lg0 .type performance.Data #txt
>Proto Lg0 .processKind NORMAL #txt
>Proto Lg0 0 0 32 24 18 0 #rect
>Proto Lg0 @|BIcon #fIcon
Lg0 f0 mainOut f4 tail #connect
Lg0 f4 head f3 mainIn #connect
Lg0 f3 mainOut f2 tail #connect
Lg0 f2 head f1 mainIn #connect
Lg0 f7 mainOut f9 tail #connect
Lg0 f9 head f6 mainIn #connect
Lg0 f6 mainOut f8 tail #connect
Lg0 f8 head f5 mainIn #connect

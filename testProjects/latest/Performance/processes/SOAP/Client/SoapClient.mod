[Ivy]
17297D7F72BCF2F9 9.3.0 #module
>Proto >Proto Collection #zClass
St0 SoapClient Big #zClass
St0 B #cInfo
St0 #process
St0 @TextInP .type .type #zField
St0 @TextInP .processKind .processKind #zField
St0 @AnnotationInP-0n ai ai #zField
St0 @MessageFlowInP-0n messageIn messageIn #zField
St0 @MessageFlowOutP-0n messageOut messageOut #zField
St0 @TextInP .xml .xml #zField
St0 @TextInP .responsibility .responsibility #zField
St0 @StartRequest f0 '' #zField
St0 @EndTask f1 '' #zField
St0 @WSElement f3 '' #zField
St0 @PushWFArc f4 '' #zField
St0 @PushWFArc f2 '' #zField
>Proto St0 St0 SoapClient #zField
St0 f0 outLink element.ivp #txt
St0 f0 inParamDecl '<> param;' #txt
St0 f0 inParamTable 'out.context=performance.soap.ServiceContext.create();
' #txt
St0 f0 requestEnabled true #txt
St0 f0 triggerEnabled false #txt
St0 f0 callSignature element() #txt
St0 f0 persist false #txt
St0 f0 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
St0 f0 caseData businessCase.attach=true #txt
St0 f0 showInStartList 1 #txt
St0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>element.ivp</name>
    </language>
</elementInfo>
' #txt
St0 f0 @C|.responsibility Everybody #txt
St0 f0 81 49 30 30 -31 17 #rect
St0 f1 337 49 30 30 0 15 #rect
St0 f3 actionTable 'out=in;
out.persons=wsResponse;
' #txt
St0 f3 clientId 17297D66BE667121 #txt
St0 f3 port PersonServicePort #txt
St0 f3 operation call #txt
St0 f3 beanConfig "" #txt
St0 f3 timeout 0 #txt
St0 f3 168 42 112 44 0 -8 #rect
St0 f4 expr out #txt
St0 f4 111 64 168 64 #arcP
St0 f2 expr out #txt
St0 f2 280 64 337 64 #arcP
>Proto St0 .type performance.soap.SoapData #txt
>Proto St0 .processKind NORMAL #txt
>Proto St0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto St0 0 0 32 24 18 0 #rect
>Proto St0 @|BIcon #fIcon
St0 f0 mainOut f4 tail #connect
St0 f4 head f3 mainIn #connect
St0 f3 mainOut f2 tail #connect
St0 f2 head f1 mainIn #connect

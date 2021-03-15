[Ivy]
17273D0D9D496ED8 3.23 #module
>Proto >Proto Collection #zClass
Rt0 RestClient Big #zClass
Rt0 B #cInfo
Rt0 #process
Rt0 @TextInP .resExport .resExport #zField
Rt0 @TextInP .type .type #zField
Rt0 @TextInP .processKind .processKind #zField
Rt0 @AnnotationInP-0n ai ai #zField
Rt0 @MessageFlowInP-0n messageIn messageIn #zField
Rt0 @MessageFlowOutP-0n messageOut messageOut #zField
Rt0 @TextInP .xml .xml #zField
Rt0 @TextInP .responsibility .responsibility #zField
Rt0 @StartRequest f0 '' #zField
Rt0 @EndTask f1 '' #zField
Rt0 @RestClientCall f3 '' #zField
Rt0 @PushWFArc f4 '' #zField
Rt0 @PushWFArc f2 '' #zField
Rt0 @StartRequest f5 '' #zField
Rt0 @GridStep f6 '' #zField
Rt0 @PushWFArc f7 '' #zField
Rt0 @EndTask f8 '' #zField
Rt0 @PushWFArc f9 '' #zField
>Proto Rt0 Rt0 RestClient #zField
Rt0 f0 outLink element.ivp #txt
Rt0 f0 type performance.rest.RestData #txt
Rt0 f0 inParamDecl '<> param;' #txt
Rt0 f0 actionDecl 'performance.rest.RestData out;
' #txt
Rt0 f0 guid 17273D0D9D848B21 #txt
Rt0 f0 requestEnabled true #txt
Rt0 f0 triggerEnabled false #txt
Rt0 f0 callSignature element() #txt
Rt0 f0 persist false #txt
Rt0 f0 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
Rt0 f0 caseData businessCase.attach=true #txt
Rt0 f0 showInStartList 1 #txt
Rt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>element.ivp</name>
    </language>
</elementInfo>
' #txt
Rt0 f0 @C|.responsibility Everybody #txt
Rt0 f0 81 49 30 30 -31 17 #rect
Rt0 f0 @|StartRequestIcon #fIcon
Rt0 f1 type performance.rest.RestData #txt
Rt0 f1 337 49 30 30 0 15 #rect
Rt0 f1 @|EndIcon #fIcon
Rt0 f3 clientId 66449c3d-3315-4036-985e-8d7956bff2cc #txt
Rt0 f3 resultType List<performance.rest.service.Person> #txt
Rt0 f3 responseCode 'in.persons = result;' #txt
Rt0 f3 clientErrorCode ivy:error:rest:client #txt
Rt0 f3 statusErrorCode ivy:error:rest:client #txt
Rt0 f3 168 42 112 44 0 -8 #rect
Rt0 f3 @|RestClientCallIcon #fIcon
Rt0 f4 expr out #txt
Rt0 f4 111 64 168 64 #arcP
Rt0 f2 280 64 337 64 #arcP
Rt0 f5 outLink api.ivp #txt
Rt0 f5 type performance.rest.RestData #txt
Rt0 f5 inParamDecl '<> param;' #txt
Rt0 f5 actionDecl 'performance.rest.RestData out;
' #txt
Rt0 f5 guid 17273D1525155728 #txt
Rt0 f5 requestEnabled true #txt
Rt0 f5 triggerEnabled false #txt
Rt0 f5 callSignature api() #txt
Rt0 f5 persist false #txt
Rt0 f5 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
Rt0 f5 caseData businessCase.attach=true #txt
Rt0 f5 showInStartList 1 #txt
Rt0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>api.ivp</name>
    </language>
</elementInfo>
' #txt
Rt0 f5 @C|.responsibility Everybody #txt
Rt0 f5 81 177 30 30 -17 17 #rect
Rt0 f5 @|StartRequestIcon #fIcon
Rt0 f6 actionDecl 'performance.rest.RestData out;
' #txt
Rt0 f6 actionTable 'out=in;
' #txt
Rt0 f6 actionCode 'import performance.rest.service.Person;
import ch.ivyteam.ivy.rest.client.GenericTypes;

in.persons = ivy.rest.client("PersonService").request().get(GenericTypes.listOf(Person.class)) as List<Person>;' #txt
Rt0 f6 type performance.rest.RestData #txt
Rt0 f6 168 170 112 44 0 -8 #rect
Rt0 f6 @|StepIcon #fIcon
Rt0 f7 expr out #txt
Rt0 f7 111 192 168 192 #arcP
Rt0 f8 type performance.rest.RestData #txt
Rt0 f8 337 177 30 30 0 15 #rect
Rt0 f8 @|EndIcon #fIcon
Rt0 f9 expr out #txt
Rt0 f9 280 192 337 192 #arcP
>Proto Rt0 .type performance.rest.RestData #txt
>Proto Rt0 .processKind NORMAL #txt
>Proto Rt0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Rt0 0 0 32 24 18 0 #rect
>Proto Rt0 @|BIcon #fIcon
Rt0 f0 mainOut f4 tail #connect
Rt0 f4 head f3 mainIn #connect
Rt0 f3 mainOut f2 tail #connect
Rt0 f2 head f1 mainIn #connect
Rt0 f5 mainOut f7 tail #connect
Rt0 f7 head f6 mainIn #connect
Rt0 f6 mainOut f9 tail #connect
Rt0 f9 head f8 mainIn #connect

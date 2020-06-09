[Ivy]
17297D0F7635769C 3.23 #module
>Proto >Proto Collection #zClass
Pe0 PersonService Big #zClass
Pe0 WS #cInfo
Pe0 #process
Pe0 @TextInP .webServiceName .webServiceName #zField
Pe0 @TextInP .implementationClassName .implementationClassName #zField
Pe0 @TextInP .authenticationType .authenticationType #zField
Pe0 @TextInP .resExport .resExport #zField
Pe0 @TextInP .type .type #zField
Pe0 @TextInP .processKind .processKind #zField
Pe0 @AnnotationInP-0n ai ai #zField
Pe0 @MessageFlowInP-0n messageIn messageIn #zField
Pe0 @MessageFlowOutP-0n messageOut messageOut #zField
Pe0 @TextInP .xml .xml #zField
Pe0 @TextInP .responsibility .responsibility #zField
Pe0 @StartWS ws0 '' #zField
Pe0 @EndWS ws1 '' #zField
Pe0 @GridStep f1 '' #zField
Pe0 @PushWFArc f2 '' #zField
Pe0 @PushWFArc f0 '' #zField
>Proto Pe0 Pe0 PersonService #zField
Pe0 ws0 inParamDecl '<> param;' #txt
Pe0 ws0 outParamDecl '<List<performance.rest.service.Person> persons> result;' #txt
Pe0 ws0 outParamTable 'result.persons=in.persons;
' #txt
Pe0 ws0 actionDecl 'performance.rest.RestData out;
' #txt
Pe0 ws0 callSignature call() #txt
Pe0 ws0 useUserDefinedException false #txt
Pe0 ws0 taskData TaskTriggered.PRI=2 #txt
Pe0 ws0 type performance.rest.RestData #txt
Pe0 ws0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>call()</name>
    </language>
</elementInfo>
' #txt
Pe0 ws0 @C|.responsibility Everybody #txt
Pe0 ws0 81 49 30 30 -13 17 #rect
Pe0 ws0 @|StartWSIcon #fIcon
Pe0 ws1 type performance.rest.RestData #txt
Pe0 ws1 337 49 30 30 0 15 #rect
Pe0 ws1 @|EndWSIcon #fIcon
Pe0 f1 actionDecl 'performance.rest.RestData out;
' #txt
Pe0 f1 actionTable 'out=in;
' #txt
Pe0 f1 actionCode 'import java.util.UUID;
import performance.rest.service.Person;

Person person = new Person();

person.FirstName="Bruno";
person.LastName="Bütler";
person.Id = UUID.randomUUID();
in.persons.add(person);

person.FirstName="Reto";
person.LastName="Weiss";
person.Id = UUID.randomUUID();
in.persons.add(person);

person.FirstName="Renato";
person.LastName="Stalder";
person.Id = UUID.randomUUID();
in.persons.add(person);

person.FirstName="Reguel";
person.LastName="Wermelinger";
person.Id = UUID.randomUUID();
in.persons.add(person);
' #txt
Pe0 f1 type performance.rest.RestData #txt
Pe0 f1 168 42 112 44 0 -8 #rect
Pe0 f1 @|StepIcon #fIcon
Pe0 f2 expr out #txt
Pe0 f2 111 64 168 64 #arcP
Pe0 f0 expr out #txt
Pe0 f0 280 64 337 64 #arcP
>Proto Pe0 .webServiceName performance.PersonService #txt
>Proto Pe0 .authenticationType 'None or Container' #txt
>Proto Pe0 .type performance.rest.RestData #txt
>Proto Pe0 .processKind WEB_SERVICE #txt
>Proto Pe0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Pe0 -8 -8 16 16 16 26 #rect
>Proto Pe0 '' #fIcon
Pe0 ws0 mainOut f2 tail #connect
Pe0 f2 head f1 mainIn #connect
Pe0 f1 mainOut f0 tail #connect
Pe0 f0 head ws1 mainIn #connect

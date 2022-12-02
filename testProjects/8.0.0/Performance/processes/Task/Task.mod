[Ivy]
184D1FD2D64C0ADB 7.5.0 #module
>Proto >Proto Collection #zClass
Tk0 Task Big #zClass
Tk0 B #cInfo
Tk0 #process
Tk0 @AnnotationInP-0n ai ai #zField
Tk0 @TextInP .type .type #zField
Tk0 @TextInP .processKind .processKind #zField
Tk0 @TextInP .xml .xml #zField
Tk0 @TextInP .responsibility .responsibility #zField
Tk0 @StartRequest f0 '' #zField
Tk0 @EndTask f1 '' #zField
Tk0 @GridStep f3 '' #zField
Tk0 @PushWFArc f4 '' #zField
Tk0 @TaskSwitchSimple f5 '' #zField
Tk0 @TkArc f6 '' #zField
Tk0 @PushWFArc f2 '' #zField
>Proto Tk0 Tk0 Task #zField
Tk0 f0 outLink task.ivp #txt
Tk0 f0 inParamDecl '<> param;' #txt
Tk0 f0 requestEnabled true #txt
Tk0 f0 triggerEnabled false #txt
Tk0 f0 callSignature task() #txt
Tk0 f0 caseData businessCase.attach=true #txt
Tk0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>task.ivp</name>
    </language>
</elementInfo>
' #txt
Tk0 f0 @C|.responsibility Everybody #txt
Tk0 f0 81 49 30 30 -21 17 #rect
Tk0 f0 @|StartRequestIcon #fIcon
Tk0 f1 433 49 30 30 0 15 #rect
Tk0 f1 @|EndIcon #fIcon
Tk0 f3 actionTable 'out=in;
' #txt
Tk0 f3 actionCode 'import performance.task.Address;
import performance.task.Phone;
import performance.task.Person;

out.contact = new Person();
out.contact.name = "Weiss";
out.contact.surName = "Reto";

Phone phone1 = new Phone();
phone1.description = "Mobile";
phone1.nr = "+41797452494";
Phone phone2 = new Phone();
phone2.description = "Home";
phone2.nr = "+41418507373";
out.contact.phones.add(phone1);
out.contact.phones.add(phone2);

Address address1 = new Address();
address1.street = "Grepperstrasse 45i";
address1.zip = 6403;
address1.city = "Küssnacht";
address1.description = "Home";

Address address2 = new Address();
address2.street = "Baarerstrasse 12";
address2.zip = 6300;
address2.city = "Zug";
address2.description = "Work";

out.contact.addresses.add(address1);
out.contact.addresses.add(address2);

out.customer = out.contact.deepClone();
' #txt
Tk0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Init data</name>
    </language>
</elementInfo>
' #txt
Tk0 f3 168 42 112 44 -21 -8 #rect
Tk0 f3 @|StepIcon #fIcon
Tk0 f4 111 64 168 64 #arcP
Tk0 f5 actionTable 'out=in1;
' #txt
Tk0 f5 taskData 'TaskA.NAM=Test Task
TaskA.SKIP_TASK_LIST=true' #txt
Tk0 f5 337 49 30 30 0 16 #rect
Tk0 f5 @|TaskSwitchSimpleIcon #fIcon
Tk0 f6 280 64 337 64 #arcP
Tk0 f2 367 64 433 64 #arcP
>Proto Tk0 .type performance.task.TaskData #txt
>Proto Tk0 .processKind NORMAL #txt
>Proto Tk0 0 0 32 24 18 0 #rect
>Proto Tk0 @|BIcon #fIcon
Tk0 f0 mainOut f4 tail #connect
Tk0 f4 head f3 mainIn #connect
Tk0 f3 mainOut f6 tail #connect
Tk0 f6 head f5 in #connect
Tk0 f5 out f2 tail #connect
Tk0 f2 head f1 mainIn #connect

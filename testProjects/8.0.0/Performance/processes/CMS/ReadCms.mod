[Ivy]
1791C5396913061C 7.5.0 #module
>Proto >Proto Collection #zClass
Rs0 ReadCms Big #zClass
Rs0 B #cInfo
Rs0 #process
Rs0 @TextInP .type .type #zField
Rs0 @TextInP .processKind .processKind #zField
Rs0 @AnnotationInP-0n ai ai #zField
Rs0 @MessageFlowInP-0n messageIn messageIn #zField
Rs0 @MessageFlowOutP-0n messageOut messageOut #zField
Rs0 @TextInP .xml .xml #zField
Rs0 @TextInP .responsibility .responsibility #zField
Rs0 @StartRequest f0 '' #zField
Rs0 @EndTask f1 '' #zField
Rs0 @GridStep f3 '' #zField
Rs0 @PushWFArc f4 '' #zField
Rs0 @PushWFArc f2 '' #zField
Rs0 @StartRequest f5 '' #zField
Rs0 @GridStep f6 '' #zField
Rs0 @PushWFArc f7 '' #zField
Rs0 @PushWFArc f8 '' #zField
>Proto Rs0 Rs0 ReadCms #zField
Rs0 f0 outLink readCmsString.ivp #txt
Rs0 f0 inParamDecl '<> param;' #txt
Rs0 f0 requestEnabled true #txt
Rs0 f0 triggerEnabled false #txt
Rs0 f0 callSignature readCmsString() #txt
Rs0 f0 persist false #txt
Rs0 f0 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Rs0 f0 caseData businessCase.attach=true #txt
Rs0 f0 showInStartList 1 #txt
Rs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>readCmsString.ivp</name>
    </language>
</elementInfo>
' #txt
Rs0 f0 @C|.responsibility Everybody #txt
Rs0 f0 81 49 30 30 -35 17 #rect
Rs0 f0 @|StartRequestIcon #fIcon
Rs0 f1 337 49 30 30 0 15 #rect
Rs0 f1 @|EndIcon #fIcon
Rs0 f3 actionTable 'out=in;
' #txt
Rs0 f3 actionCode 'import ch.ivyteam.ivy.bpm.error.BpmError;
import org.apache.commons.lang3.StringUtils;
import java.util.Random;
            
Random random = new Random();
for (int count = 0; count < 100; count++)
{
  String uri = "/labels/label"+random.nextInt(10000);
  String co = ivy.cms.co(uri);
  if (StringUtils.isBlank(co)) {
   BpmError.create("conotfound")
     .withMessage("could not find co " + uri)
     .throwError();    
  }
}
           ' #txt
Rs0 f3 168 42 112 44 0 -8 #rect
Rs0 f3 @|StepIcon #fIcon
Rs0 f4 expr out #txt
Rs0 f4 111 64 168 64 #arcP
Rs0 f2 expr out #txt
Rs0 f2 280 64 337 64 #arcP
Rs0 f5 outLink readCmsFile.ivp #txt
Rs0 f5 inParamDecl '<> param;' #txt
Rs0 f5 requestEnabled true #txt
Rs0 f5 triggerEnabled false #txt
Rs0 f5 callSignature readCmsFile() #txt
Rs0 f5 caseData businessCase.attach=true #txt
Rs0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>readCmsFile.ivp</name>
    </language>
</elementInfo>
' #txt
Rs0 f5 @C|.responsibility Everybody #txt
Rs0 f5 81 145 30 30 -25 17 #rect
Rs0 f5 @|StartRequestIcon #fIcon
Rs0 f6 actionTable 'out=in;
' #txt
Rs0 f6 actionCode 'import org.apache.commons.lang3.StringUtils;
import ch.ivyteam.ivy.bpm.error.BpmError;
import java.util.Random;

Random random = new Random();
for (int count = 0; count < 100; count++)
{
  String uri = "/files/"+random.nextInt(1000);
  String ref = ivy.cms.co(uri);
  if (StringUtils.isBlank(ref)) {
    BpmError.create("conotfound")
       .withMessage("could not find co " + uri)
       .throwError();
     
   }
 }
 ' #txt
Rs0 f6 168 122 112 44 0 -7 #rect
Rs0 f6 @|StepIcon #fIcon
Rs0 f7 110 158 168 144 #arcP
Rs0 f8 224 122 339 71 #arcP
>Proto Rs0 .type performance.Data #txt
>Proto Rs0 .processKind NORMAL #txt
>Proto Rs0 0 0 32 24 18 0 #rect
>Proto Rs0 @|BIcon #fIcon
Rs0 f0 mainOut f4 tail #connect
Rs0 f4 head f3 mainIn #connect
Rs0 f3 mainOut f2 tail #connect
Rs0 f2 head f1 mainIn #connect
Rs0 f5 mainOut f7 tail #connect
Rs0 f7 head f6 mainIn #connect
Rs0 f6 mainOut f8 tail #connect
Rs0 f8 head f1 mainIn #connect

[Ivy]
1791C53DC81E6D3E 7.5.0 #module
>Proto >Proto Collection #zClass
Fs0 FillCms Big #zClass
Fs0 B #cInfo
Fs0 #process
Fs0 @TextInP .type .type #zField
Fs0 @TextInP .processKind .processKind #zField
Fs0 @AnnotationInP-0n ai ai #zField
Fs0 @MessageFlowInP-0n messageIn messageIn #zField
Fs0 @MessageFlowOutP-0n messageOut messageOut #zField
Fs0 @TextInP .xml .xml #zField
Fs0 @TextInP .responsibility .responsibility #zField
Fs0 @EndTask f1 '' #zField
Fs0 @GridStep f3 '' #zField
Fs0 @PushWFArc f2 '' #zField
Fs0 @StartRequest f0 '' #zField
Fs0 @PushWFArc f4 '' #zField
>Proto Fs0 Fs0 FillCms #zField
Fs0 f1 337 49 30 30 0 15 #rect
Fs0 f1 @|EndIcon #fIcon
Fs0 f3 actionTable 'out=in;
' #txt
Fs0 f3 actionCode 'import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import ch.ivyteam.ivy.cm.IContentObjectValue;
import ch.ivyteam.ivy.cm.IContentObject;
import ch.ivyteam.ivy.cm.CoType;
import java.util.Locale;

//IContentObject files = ivy.cms.getRootContentObject().addChild("files", "Files", CoType.FOLDER, "rwei");
IContentObject files = ivy.cms.getRootContentObject().getChild("files");
for(int count = 141; count < 1000; count++)
{
  IContentObject label = files.addChild(""+count, "File "+count, CoType.TEXT, "rwei");
  IContentObjectValue value = label.addValue("Label "+count, null, null, Locale.ENGLISH, "rwei", true, "");
  String content = RandomStringUtils.randomAlphabetic(10, 100);
  value.setContent(""+content, "rwei");
}' #txt
Fs0 f3 168 42 112 44 0 -8 #rect
Fs0 f3 @|StepIcon #fIcon
Fs0 f2 expr out #txt
Fs0 f2 280 64 337 64 #arcP
Fs0 f0 outLink start.ivp #txt
Fs0 f0 inParamDecl '<> param;' #txt
Fs0 f0 requestEnabled true #txt
Fs0 f0 triggerEnabled false #txt
Fs0 f0 callSignature start() #txt
Fs0 f0 caseData businessCase.attach=true #txt
Fs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
Fs0 f0 @C|.responsibility Everybody #txt
Fs0 f0 81 49 30 30 -25 17 #rect
Fs0 f0 @|StartRequestIcon #fIcon
Fs0 f4 111 64 168 64 #arcP
>Proto Fs0 .type performance.Data #txt
>Proto Fs0 .processKind NORMAL #txt
>Proto Fs0 0 0 32 24 18 0 #rect
>Proto Fs0 @|BIcon #fIcon
Fs0 f3 mainOut f2 tail #connect
Fs0 f2 head f1 mainIn #connect
Fs0 f0 mainOut f4 tail #connect
Fs0 f4 head f3 mainIn #connect

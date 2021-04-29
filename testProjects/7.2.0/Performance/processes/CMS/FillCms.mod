[Ivy]
1791C53DC81E6D3E 3.23 #module
>Proto >Proto Collection #zClass
Fs0 FillCms Big #zClass
Fs0 B #cInfo
Fs0 #process
Fs0 @TextInP .resExport .resExport #zField
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
>Proto Fs0 Fs0 FillCms #zField
Fs0 f1 type performance.Data #txt
Fs0 f1 337 49 30 30 0 15 #rect
Fs0 f1 @|EndIcon #fIcon
Fs0 f3 actionDecl 'performance.Data out;
' #txt
Fs0 f3 actionTable 'out=in;
' #txt
Fs0 f3 actionCode 'import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import ch.ivyteam.ivy.cm.IContentObjectValue;
import ch.ivyteam.ivy.cm.IContentObject;
import ch.ivyteam.ivy.cm.CoType;
import java.util.Locale;

IContentObject labels = ivy.cms.getRootContentObject().addChild("labels", "Labels", CoType.FOLDER, "rwei");
for(int count = 0; count < 10000; count++)
{
  IContentObject label = labels.addChild("label"+count, "Label "+count, CoType.STRING, "rwei");
  IContentObjectValue value = label.addValue("Label "+count, null, null, Locale.ENGLISH, "rwei", true, "");
  String content = RandomStringUtils.randomAlphabetic(10, 100);
  value.setContent(""+content, "rwei");
}' #txt
Fs0 f3 type performance.Data #txt
Fs0 f3 168 42 112 44 0 -8 #rect
Fs0 f3 @|StepIcon #fIcon
Fs0 f2 expr out #txt
Fs0 f2 280 64 337 64 #arcP
>Proto Fs0 .type performance.Data #txt
>Proto Fs0 .processKind NORMAL #txt
>Proto Fs0 0 0 32 24 18 0 #rect
>Proto Fs0 @|BIcon #fIcon
Fs0 f3 mainOut f2 tail #connect
Fs0 f2 head f1 mainIn #connect

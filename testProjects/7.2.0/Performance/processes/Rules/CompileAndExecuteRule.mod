[Ivy]
172E670BBE4A3218 3.23 #module
>Proto >Proto Collection #zClass
Ce0 CompileAndExecuteRule Big #zClass
Ce0 B #cInfo
Ce0 #process
Ce0 @TextInP .resExport .resExport #zField
Ce0 @TextInP .type .type #zField
Ce0 @TextInP .processKind .processKind #zField
Ce0 @AnnotationInP-0n ai ai #zField
Ce0 @MessageFlowInP-0n messageIn messageIn #zField
Ce0 @MessageFlowOutP-0n messageOut messageOut #zField
Ce0 @TextInP .xml .xml #zField
Ce0 @TextInP .responsibility .responsibility #zField
Ce0 @StartRequest f0 '' #zField
Ce0 @EndTask f1 '' #zField
Ce0 @GridStep f3 '' #zField
Ce0 @PushWFArc f4 '' #zField
Ce0 @PushWFArc f2 '' #zField
>Proto Ce0 Ce0 CompileAndExecuteRule #zField
Ce0 f0 outLink compileAndExecuteRule.ivp #txt
Ce0 f0 type performance.rule.Member #txt
Ce0 f0 inParamDecl '<> param;' #txt
Ce0 f0 inParamTable 'out.memberType=performance.rule.MemberType.Silver;
out.purchaseAmount=1000;
' #txt
Ce0 f0 actionDecl 'performance.rule.Member out;
' #txt
Ce0 f0 guid 172E670BC0913F92 #txt
Ce0 f0 requestEnabled true #txt
Ce0 f0 triggerEnabled false #txt
Ce0 f0 callSignature compileAndExecuteRule() #txt
Ce0 f0 persist false #txt
Ce0 f0 taskData 'TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody' #txt
Ce0 f0 caseData businessCase.attach=true #txt
Ce0 f0 showInStartList 1 #txt
Ce0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>compileAndExecuteRule.ivp</name>
    </language>
</elementInfo>
' #txt
Ce0 f0 @C|.responsibility Everybody #txt
Ce0 f0 81 49 30 30 -76 17 #rect
Ce0 f0 @|StartRequestIcon #fIcon
Ce0 f1 type performance.rule.Member #txt
Ce0 f1 337 49 30 30 0 15 #rect
Ce0 f1 @|EndIcon #fIcon
Ce0 f3 actionDecl 'performance.rule.Member out;
' #txt
Ce0 f3 actionTable 'out=in;
' #txt
Ce0 f3 actionCode 'import ch.ivyteam.ivy.rule.engine.api.IRuleBase;

IRuleBase ruleBase = ivy.rules.engine.createRuleBase();
ruleBase.loadRulesFromNamespace("rule.engine.drl");

ruleBase.createSession().execute(in);' #txt
Ce0 f3 type performance.rule.Member #txt
Ce0 f3 168 42 112 44 0 -8 #rect
Ce0 f3 @|StepIcon #fIcon
Ce0 f4 expr out #txt
Ce0 f4 111 64 168 64 #arcP
Ce0 f2 expr out #txt
Ce0 f2 280 64 337 64 #arcP
>Proto Ce0 .type performance.rule.Member #txt
>Proto Ce0 .processKind NORMAL #txt
>Proto Ce0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Ce0 0 0 32 24 18 0 #rect
>Proto Ce0 @|BIcon #fIcon
Ce0 f0 mainOut f4 tail #connect
Ce0 f4 head f3 mainIn #connect
Ce0 f3 mainOut f2 tail #connect
Ce0 f2 head f1 mainIn #connect

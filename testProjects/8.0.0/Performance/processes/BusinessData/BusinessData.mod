[Ivy]
1848AB6ADCA8F207 7.5.0 #module
>Proto >Proto Collection #zClass
Ba0 BusinessData Big #zClass
Ba0 B #cInfo
Ba0 #process
Ba0 @AnnotationInP-0n ai ai #zField
Ba0 @TextInP .type .type #zField
Ba0 @TextInP .processKind .processKind #zField
Ba0 @TextInP .xml .xml #zField
Ba0 @TextInP .responsibility .responsibility #zField
Ba0 @StartRequest f0 '' #zField
Ba0 @EndTask f1 '' #zField
Ba0 @StartRequest f3 '' #zField
Ba0 @StartRequest f4 '' #zField
Ba0 @EndTask f5 '' #zField
Ba0 @EndTask f6 '' #zField
Ba0 @GridStep f7 '' #zField
Ba0 @GridStep f8 '' #zField
Ba0 @GridStep f9 '' #zField
Ba0 @PushWFArc f10 '' #zField
Ba0 @PushWFArc f2 '' #zField
Ba0 @PushWFArc f11 '' #zField
Ba0 @PushWFArc f12 '' #zField
Ba0 @PushWFArc f13 '' #zField
Ba0 @PushWFArc f14 '' #zField
>Proto Ba0 Ba0 BusinessData #zField
Ba0 f0 outLink fillBusinessData.ivp #txt
Ba0 f0 inParamDecl '<> param;' #txt
Ba0 f0 requestEnabled true #txt
Ba0 f0 triggerEnabled false #txt
Ba0 f0 callSignature fillBusinessData() #txt
Ba0 f0 caseData businessCase.attach=true #txt
Ba0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>fillBusinessData.ivp</name>
    </language>
</elementInfo>
' #txt
Ba0 f0 @C|.responsibility Everybody #txt
Ba0 f0 81 49 30 30 -25 17 #rect
Ba0 f0 @|StartRequestIcon #fIcon
Ba0 f1 337 49 30 30 0 15 #rect
Ba0 f1 @|EndIcon #fIcon
Ba0 f3 outLink searchBusinessData.ivp #txt
Ba0 f3 inParamDecl '<> param;' #txt
Ba0 f3 requestEnabled true #txt
Ba0 f3 triggerEnabled false #txt
Ba0 f3 callSignature searchBusinessData() #txt
Ba0 f3 caseData businessCase.attach=true #txt
Ba0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>searchBusinessData.ivp</name>
    </language>
</elementInfo>
' #txt
Ba0 f3 @C|.responsibility Everybody #txt
Ba0 f3 81 145 30 30 -29 17 #rect
Ba0 f3 @|StartRequestIcon #fIcon
Ba0 f4 outLink findBusinessData.ivp #txt
Ba0 f4 inParamDecl '<> param;' #txt
Ba0 f4 requestEnabled true #txt
Ba0 f4 triggerEnabled false #txt
Ba0 f4 callSignature findBusinessData() #txt
Ba0 f4 caseData businessCase.attach=true #txt
Ba0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>findBusinessData.ivp</name>
    </language>
</elementInfo>
' #txt
Ba0 f4 @C|.responsibility Everybody #txt
Ba0 f4 81 225 30 30 -29 17 #rect
Ba0 f4 @|StartRequestIcon #fIcon
Ba0 f5 385 145 30 30 0 15 #rect
Ba0 f5 @|EndIcon #fIcon
Ba0 f6 401 209 30 30 0 15 #rect
Ba0 f6 @|EndIcon #fIcon
Ba0 f7 actionTable 'out=in;
' #txt
Ba0 f7 actionCode 'import performance.businessdata.BusinessDataPerformance;
BusinessDataPerformance.search();' #txt
Ba0 f7 184 122 112 44 0 -7 #rect
Ba0 f7 @|StepIcon #fIcon
Ba0 f8 actionTable 'out=in;
' #txt
Ba0 f8 actionCode 'import performance.businessdata.BusinessDataPerformance;
BusinessDataPerformance.find();' #txt
Ba0 f8 200 202 112 44 0 -7 #rect
Ba0 f8 @|StepIcon #fIcon
Ba0 f9 actionTable 'out=in;
' #txt
Ba0 f9 actionCode 'import performance.businessdata.BusinessDataPerformance;
BusinessDataPerformance.fill();' #txt
Ba0 f9 168 42 112 44 0 -7 #rect
Ba0 f9 @|StepIcon #fIcon
Ba0 f10 111 64 168 64 #arcP
Ba0 f2 280 64 337 64 #arcP
Ba0 f11 110 158 184 144 #arcP
Ba0 f12 296 144 385 158 #arcP
Ba0 f13 110 238 200 224 #arcP
Ba0 f14 312 224 401 224 #arcP
>Proto Ba0 .type performance.Data #txt
>Proto Ba0 .processKind NORMAL #txt
>Proto Ba0 0 0 32 24 18 0 #rect
>Proto Ba0 @|BIcon #fIcon
Ba0 f0 mainOut f10 tail #connect
Ba0 f10 head f9 mainIn #connect
Ba0 f9 mainOut f2 tail #connect
Ba0 f2 head f1 mainIn #connect
Ba0 f3 mainOut f11 tail #connect
Ba0 f11 head f7 mainIn #connect
Ba0 f7 mainOut f12 tail #connect
Ba0 f12 head f5 mainIn #connect
Ba0 f4 mainOut f13 tail #connect
Ba0 f13 head f8 mainIn #connect
Ba0 f8 mainOut f14 tail #connect
Ba0 f14 head f6 mainIn #connect

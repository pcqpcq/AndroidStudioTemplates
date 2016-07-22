<#if !(perModuleRepositories??) || perModuleRepositories>
buildscript {
    repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
    }
}
</#if>
<#if isLibraryProject?? && isLibraryProject>
apply plugin: 'com.android.library'
apply plugin: 'me.tatarka.retrolambda'
<#else>
apply plugin: 'com.android.application'
apply plugin: 'me.tatarka.retrolambda'
</#if>
<#if !(perModuleRepositories??) || perModuleRepositories>

repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
}
</#if>

android {
    compileSdkVersion <#if buildApiString?matches("^\\d+$")>${buildApiString}<#else>'${buildApiString}'</#if>
    buildToolsVersion "${buildToolsVersion}"

    defaultConfig {
    <#if isLibraryProject?? && isLibraryProject>
    <#else>
    applicationId "${packageName}"
    </#if>
        minSdkVersion <#if minApi?matches("^\\d+$")>${minApi}<#else>'${minApi}'</#if>
        targetSdkVersion <#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>
        versionCode 1
        versionName "1.0"
    }
    productFlavors {
        dev {
            minSdkVersion 21
        }
        publish {
            minSdkVersion 16
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    if(project.hasProperty("RELEASE_STORE_FILE")) {
        signingConfigs {    
           release {
               storeFile file(RELEASE_STORE_FILE)
               storePassword RELEASE_STORE_PASSWORD
               keyAlias RELEASE_KEY_ALIAS
               keyPassword RELEASE_KEY_PASSWORD
           }
        }
    }
<#if enableProGuard>
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            if(project.hasProperty("RELEASE_STORE_FILE")) {
                shrinkResources true
                signingConfig signingConfigs.release
            }
        }
    }
</#if>
    lintOptions {
        abortOnError false
    }
    dataBinding {
        enabled = true
    }
}

dependencies {
    <#if dependencyList?? >
    <#list dependencyList as dependency>
    compile '${dependency}'
    </#list>
    </#if>
    compile fileTree(dir: 'libs', include: ['*.jar'])
<#if WearprojectName?has_content && NumberOfEnabledFormFactors?has_content && NumberOfEnabledFormFactors gt 1 && Wearincluded>
    wearApp project(':${WearprojectName}')
    compile 'com.google.android.gms:play-services:+'
</#if>
<#if unitTestsSupported>
    testCompile 'junit:junit:${junitVersion}'
</#if>
<#if isLibraryProject?? && !isLibraryProject>
    compile 'com.github.mmin18.layoutcast:library:1.+@aar'
</#if>
    compile 'com.jiongbull:jlog:1.0.5'
}

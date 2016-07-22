<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">

    <uses-permission android:name="android.permission.INTERNET" />
    
    <application <#if minApiLevel gte 4 && buildApi gte 4>android:allowBackup="true"</#if>
        android:label="@string/app_name"<#if copyIcons && !isLibraryProject>
        android:icon="@mipmap/ic_launcher"<#elseif assetName??>
        android:icon="@drawable/${assetName}"</#if>
        android:name=".ProjectApp"
        <#if buildApi gte 17>android:supportsRtl="true"</#if>
        <#if baseTheme != "none" && !isLibraryProject>
        android:theme="@style/AppTheme"</#if>>

        <#if isLibraryProject?? && !isLibraryProject>
            <activity android:name="com.github.mmin18.layoutcast.ResetActivity" />
        </#if>
    </application>

</manifest>

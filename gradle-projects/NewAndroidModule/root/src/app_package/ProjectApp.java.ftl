package ${packageName};

import android.app.Application;

<#if isLibraryProject?? && !isLibraryProject>
import com.github.mmin18.layoutcast.LayoutCast;
</#if>
import com.jiongbull.jlog.JLog;

/**
 * Project Application
 */
public class ProjectApp extends Application {
	@Override
    public void onCreate() {
        super.onCreate();

        if (BuildConfig.DEBUG) {
        	<#if isLibraryProject?? && !isLibraryProject>
        	LayoutCast.init(this);
            </#if>
	        JLog.init(this);
        }
    }
}
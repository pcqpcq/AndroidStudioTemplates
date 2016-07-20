package ${packageName};

import android.app.Application;

import com.github.mmin18.layoutcast.LayoutCast;
import com.jiongbull.jlog.JLog;

/**
 * Project Application
 */
public class ProjectApp extends Application {
	@Override
    public void onCreate() {
        super.onCreate();

        if (BuildConfig.DEBUG) {
            LayoutCast.init(this);
	        JLog.init(this);
        }
    }
}
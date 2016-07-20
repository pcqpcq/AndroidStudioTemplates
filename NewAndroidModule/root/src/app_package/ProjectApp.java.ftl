package ${packageName};

import android.app.Application;

import com.github.mmin18.layoutcast.LayoutCast;

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
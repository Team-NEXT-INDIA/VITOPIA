package com.arize.vitopia
import com.prongbang.screenprotect.AndroidScreenProtector
import com.prongbang.screenprotect.ScreenProtectorByActivityLifecycle

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    private val screenProtector by lazy { AndroidScreenProtector.newInstance(this) }

    // For Android 12+
    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)

        screenProtector.process(hasFocus.not())
    }

}

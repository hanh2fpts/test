import android.content.Context
import android.widget.Toast
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class ToastPlatformAndroid {
    companion object {
        private const val CHANNEL = "samples.flutter.dev/toastMessage"

        fun registerWith(flutterEngine: FlutterEngine, context: Context) {
            val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            channel.setMethodCallHandler { call, result ->
                if (call.method == "toastMessage") {
                    val text = "Hello from Android!"
                    val duration = Toast.LENGTH_SHORT
                    val toast = Toast.makeText(context, text, duration)
                    toast.show()
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
        }
    }
}
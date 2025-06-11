package com.example.new_test

import android.os.Bundle
import android.util.Base64
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import java.security.MessageDigest

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // ✅ 키 해시 출력용 코드 추가
        try {
            val info = packageManager.getPackageInfo(
                packageName,
                android.content.pm.PackageManager.GET_SIGNING_CERTIFICATES
            )
            info.signingInfo?.let { signingInfo ->
                for (signature in signingInfo.apkContentsSigners) {
                    val md = MessageDigest.getInstance("SHA")
                    md.update(signature.toByteArray())
                    val keyHash = Base64.encodeToString(md.digest(), Base64.NO_WRAP)
                    Log.d("🔥 KeyHash", keyHash)
                }
            }
        } catch (e: Exception) {
            Log.e("KeyHash", "키 해시 실패: ${e.message}")
        }
    }
}

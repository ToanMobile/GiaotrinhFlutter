package com.toandev.lesson1

import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.toandev.lesson1.activity.DemoActivity
import com.toandev.lesson1.broadcast.BatteryLevelReceiver
import com.toandev.lesson1.checknull.CheckNullJava
import com.toandev.lesson1.checknull.CheckNullKotlin
import com.toandev.lesson1.data.DataClassJava
import com.toandev.lesson1.data.DataClassKotlin
import com.toandev.lesson1.data.DataClassKotlinDefaultArgument
import com.toandev.lesson1.list.ListJava
import com.toandev.lesson1.list.ListKotlin


class MainActivity : AppCompatActivity() {
    private var batteryLevelReceiver = BatteryLevelReceiver()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //Data Class
        val dataClass = DataClassKotlin(title = "Lesson1", author = "Toan1")

        val dataClassJava = DataClassJava()
        dataClassJava.title = "Lesson1"
        dataClassJava.author = "Toan1"

        Log.e("dataClass=", dataClass.toString())
        Log.e("dataClassJava=", dataClassJava.toString())

        //Check Null
        Log.e("CheckNull=", CheckNullKotlin().doSomething())
        Log.e("CheckNullJava=", CheckNullJava().doSomething())

        //Data Class Argument
        val dataClassDefault = DataClassKotlinDefaultArgument()
        Log.e("dataClassDefault=", dataClassDefault.toString())

        //Collection
        ListJava().doSomething()
        ListKotlin().doSomething()

        //Demo Activity
        findViewById<Button>(R.id.btnOpenDemoActivity).setOnClickListener {
            val intent = Intent(this, DemoActivity::class.java)
            startActivity(intent)
        }

        //Demo broadcast
        val batteryLevelFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        registerReceiver(batteryLevelReceiver, batteryLevelFilter)
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(batteryLevelReceiver)
    }
}
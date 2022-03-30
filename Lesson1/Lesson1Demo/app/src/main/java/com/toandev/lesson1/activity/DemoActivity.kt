package com.toandev.lesson1.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.toandev.lesson1.R
import com.toandev.lesson1.checknull.CheckNullKotlin
import com.toandev.lesson1.checknull.CheckNullJava
import com.toandev.lesson1.data.DataClassKotlin
import com.toandev.lesson1.data.DataClassJava
import com.toandev.lesson1.data.DataClassKotlinDefaultArgument
import com.toandev.lesson1.list.ListJava
import com.toandev.lesson1.list.ListKotlin

class DemoActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_demo)
    }
}
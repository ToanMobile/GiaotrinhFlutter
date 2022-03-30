package com.toandev.lesson1.list;

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

public class ListJava {
    public void doSomething() {
        List<Integer> listData = new ArrayList();
        for (int i = 0; i < 100; i++) {
            listData.add(i);
        }

        List<Integer> newList = new ArrayList();
        for (int j : listData) {
            if ((j % 10) == 0) {
                newList.add(j);
            }
        }
        Log.e("newListJava==", newList.toString());
    }
}

package com.toandev.lesson1.checknull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
public class CheckNullJava {
    private List<String> listData = new ArrayList<>();
    private String text ="Toan1";

    public String doSomething() {
        if (listData != null) {
            if (text != null) {
                listData.add(text);
                return listData.get(0);
            } else {
                return "List is Null";
            }
        } else {
            return "List is Null";
        }
    }
}

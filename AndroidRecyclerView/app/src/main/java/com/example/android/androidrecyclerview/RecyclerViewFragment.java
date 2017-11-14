package com.example.android.androidrecyclerview;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
//import android.support.v7.widget.GridLayoutManager;
//import android.support.v7.widget.LinearLayoutManager;
import android.view.View;
import android.view.ViewGroup;

/**
 * Created by Administrator on 2017/11/14.
 */

public class RecyclerViewFragment extends Fragment {
    private static final  String TAG="RecyclerViewFragment";

//protected LayoutManagerType mCurrentLayoutManagerType;


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View rootView = inflater.inflate();
        return rootView;
    }
}

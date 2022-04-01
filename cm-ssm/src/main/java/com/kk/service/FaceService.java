package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pojo.Face;
import com.kk.pojo.FaceExtend;

import java.util.List;

public interface FaceService {
    int addFace(Face face);
    PageInfo<FaceExtend> faceList();

    String openFaceDoor(String image);


}

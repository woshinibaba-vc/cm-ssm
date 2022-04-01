package com.kk.mapper;

import com.kk.pojo.Face;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FaceMapper {
    @Insert("insert into face values(#{face_token},#{uid},#{time})")
    int addFace(Face face);

    @Select("select * from face order by time desc")
    List<Face> faceList();
}

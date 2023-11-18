package com.railway.dao;

import com.railway.pojo.RailwayCrossing;

import java.util.List;

public interface RailwayDAO {

    List<RailwayCrossing> getAllCrossings();

    RailwayCrossing getCrossingById(int id);
    
    void addCrossing(RailwayCrossing crossing);

    void deleteCrossing(int id);
}


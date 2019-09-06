package com.lqh.esdao;

import entity.Good;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
//import org.springframework.data.repository.CrudRepository;

public interface GoodEsDao extends ElasticsearchRepository<Good, Integer> {
    Page<Good> findByName(String name, Pageable pageable);
    Page<Good> findByCategoryIdStartingWith(String categoryId, Pageable pageable);
    Page<Good> findByCategoryOrNameOrSubNameOrderBySortWeightAsc(String keyword1, String keyword2, String keyword3, PageRequest of);
}

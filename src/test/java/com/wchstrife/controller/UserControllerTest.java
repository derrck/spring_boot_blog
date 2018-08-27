package com.wchstrife.controller;

import com.wchstrife.entity.Article;
import com.wchstrife.service.ArticleService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by wangchenghao on 2017/8/2.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserControllerTest {
    @Autowired
    ArticleService articleService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Test
    public void admin(){

        List<Article> articles = articleService.list();

        for (int i=0; i<articles.size(); i++){
            System.out.println(articles.get(i).getId());
        }
    }
    @Test
    public void test() throws Exception {

        //save string
        stringRedisTemplate.opsForValue().set("aaa", "111");
        Assert.assertEquals("111", stringRedisTemplate.opsForValue().get("aaa"));
    }

}
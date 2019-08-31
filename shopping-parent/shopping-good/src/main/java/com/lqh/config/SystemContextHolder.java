package com.lqh.config;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SystemContextHolder {

    private SystemContext context;

    // 私有构造方法
    private SystemContextHolder() { context = new SystemContext(); }

    // 私有实例
    private static SystemContextHolder instance = null;

    public static SystemContextHolder getInstance() {
        if(null == instance)
            synchronized (SystemContextHolder.class) {
                if(null == instance) {
                    SystemContextHolder holder = new SystemContextHolder();
                    instance = holder;
                }
            }
        return instance;
    }
}

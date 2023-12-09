package com.parsley.service;

import com.parsley.domain.Tab;

import java.util.List;

public interface TabService {

    List<Tab> getAllTabs();

    Tab getByTabNameEn(String tabName);
}

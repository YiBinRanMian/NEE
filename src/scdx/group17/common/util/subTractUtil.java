package scdx.group17.common.util;

import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class subTractUtil {
    public static <T> List<T> subtractList(List<T> list1, List<T> list2, String argumentName) {
        List<T> result = new ArrayList<T>();
        if (CollectionUtils.isEmpty(list1)) {
            return result;
        }
        if (CollectionUtils.isEmpty(list2)) {
            return list1;
        }
        Map<Object, T> map = initMap(list2, argumentName);
        for (T t : list1) {
            BeanWrapper beanWrapper = new BeanWrapperImpl(t);
            Object value = beanWrapper.getPropertyValue(argumentName);
            if (map.get(value) == null) {
                result.add(t);
            }
        }
        return result;
    }

    private static <T> Map<Object, T> initMap(List<T> list2, String argumentName) {
        Map<Object, T> resultMap = new HashMap<Object, T>(list2.size());
        for (T t : list2) {
            BeanWrapper beanWrapper = new BeanWrapperImpl(t);
            if (beanWrapper.getPropertyValue(argumentName) == null) {
                throw new RuntimeException("argumentName is null");
            }
            resultMap.put(beanWrapper.getPropertyValue(argumentName), t);
        }
        return resultMap;
    }
}

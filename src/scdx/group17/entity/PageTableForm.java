package scdx.group17.entity;

import java.util.List;

public class PageTableForm {
    private int currentPage;
    private int pageSize = 3;
    private int beginIndex;
    private int endIndex;
    private int pageCount;
    private int Count;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getBeginIndex() {
        return beginIndex;
    }

    public void setBeginIndex(int beginIndex) {
        this.beginIndex = beginIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(int endIndex) {
        this.endIndex = endIndex;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getCount() {
        return Count;
    }

    public void setCount(int count) {
        Count = count;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public PageTableForm(int currentPage, int pageSize, int beginIndex, int endIndex, int pageCount, int count, List<Question> questionList) {

        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.beginIndex = beginIndex;
        this.endIndex = endIndex;
        this.pageCount = pageCount;
        Count = count;
        this.questionList = questionList;
    }

    public PageTableForm(){

    }
    private List<Question> questionList;
}

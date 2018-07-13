package scdx.group17.entity;

public class Question {
    private Integer qID;
    private Integer id;
    private String category;
    private String type;
    private String title;
    private String answer;
    private Integer score;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;


    public Integer getqID() {
        return qID;
    }

    public void setqID(Integer qID) {
        this.qID = qID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    public Question(Integer qID, Integer id,String category, String type, String title, String answer, Integer score,  String optionA, String optionB, String optionC, String optionD) {

        this.qID = qID;
        this.id = id;
        this.category = category;
        this.type = type;
        this.title = title;
        this.answer = answer;
        this.score = score;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
    }

    public Question(){

    }
}

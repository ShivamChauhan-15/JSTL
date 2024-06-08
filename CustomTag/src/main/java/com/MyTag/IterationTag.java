package com.MyTag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class IterationTag extends TagSupport {

    int numberOfIterations;
    int currentIteration;

    public int getNumberOfIterations() {
        return numberOfIterations;
    }

    public void setNumberOfIterations(int numberOfIterations) {
        this.numberOfIterations = numberOfIterations;
    }

    public int doStartTag() throws JspException {
        return EVAL_BODY_INCLUDE;
    }

    public int doAfterBody() throws JspException {
        if (currentIteration < numberOfIterations - 1) {
            currentIteration++;
            return EVAL_BODY_AGAIN;
        } else {
            currentIteration = 0;
            return SKIP_BODY;
        }
    }
}

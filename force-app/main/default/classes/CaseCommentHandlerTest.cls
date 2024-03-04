@isTest
public class CaseCommentHandlerTest {

    @isTest
    static void caseCommenter(){
        Case testCase = new Case(Subject = 'Test Case');
        insert testCase;

        CaseComment comment1 = new CaseComment(ParentId = testCase.Id, CommentBody = 'First comment');
        CaseComment comment2 = new CaseComment(ParentId = testCase.Id, CommentBody = 'Second comment');
        insert new List<CaseComment>{comment1, comment2};

        // Call the method to count comments
        Map<Id, Integer> result = CaseCommentHandler.countCaseComments();

        // Verify the count
        System.assertEquals(2, result.get(testCase.Id));

    }
}
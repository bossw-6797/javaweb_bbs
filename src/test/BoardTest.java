package test;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import entity.Board;

public class BoardTest {
	public static void main(String[] args){
		Map<Integer,List<Board>> mapBoard = new HashMap<Integer,List<Board>>();
		
		Board mainBoard1 = new Board();
		mainBoard1.setBoardId(1);
		mainBoard1.setBoardName(".NET方向");
		mainBoard1.setParentId(0);
		
		Board mainBoard2 = new Board();
		mainBoard2.setBoardId(2);
		mainBoard2.setBoardName("Java方向");
		mainBoard2.setParentId(0);
		
		List<Board> mainBoardList = new ArrayList<Board>();
		mainBoardList.add(mainBoard1);
		mainBoardList.add(mainBoard2);
		
		mapBoard.put(0,mainBoardList);
		Board sonBoard1 = new Board();
		sonBoard1.setBoardId(3);
		sonBoard1.setBoardName("C#语言");
		sonBoard1.setParentId(1);
		
		Board sonBoard2 = new Board();
		sonBoard2.setBoardId(4);
		sonBoard2.setBoardName("WinForms");
		sonBoard2.setParentId(1);
		
		Board sonBoard3 = new Board();
		sonBoard3.setBoardId(5);
		sonBoard3.setBoardName("ADO.NET");
		sonBoard3.setParentId(1);
		
		Board sonBoard4 = new Board();
		sonBoard4.setBoardId(6);
		sonBoard4.setBoardName("ASP.NET");
		sonBoard4.setParentId(1);
		
		List<Board> sonBoardList1 = new ArrayList<Board>();
		sonBoardList1.add(sonBoard1);
		sonBoardList1.add(sonBoard2);
		sonBoardList1.add(sonBoard3);
		sonBoardList1.add(sonBoard4);
		
		mapBoard.put(1, sonBoardList1);
		
		Board sonBoard5 = new Board();
		sonBoard5.setBoardId(7);
		sonBoard5.setBoardName("Java基础");
		sonBoard5.setParentId(2);
		
		Board sonBoard6 = new Board();
		sonBoard6.setBoardId(8);
		sonBoard6.setBoardName("JSP技术");
		sonBoard6.setParentId(2);
		
		Board sonBoard7 = new Board();
		sonBoard7.setBoardId(9);
		sonBoard7.setBoardName("Servlet技术");
		sonBoard7.setParentId(2);
		
		Board sonBoard8 = new Board();
		sonBoard8.setBoardId(10);
		sonBoard8.setBoardName("Eclipse应用");
		sonBoard8.setParentId(2);
		
		List<Board> sonBoardList2 = new ArrayList<Board>();
		sonBoardList2.add(sonBoard5);
		sonBoardList2.add(sonBoard6);
		sonBoardList2.add(sonBoard7);
		sonBoardList2.add(sonBoard8);
		
		mapBoard.put(2, sonBoardList2);
		
		List<Board> listMainBoard = mapBoard.get(new Integer(0));
		for(Board mainBoard:listMainBoard){
			System.out.println(mainBoard.getBoardName());
			List<Board>listSonBoard = mapBoard.get(mainBoard.getBoardId());
			for(Board sonBoard:listSonBoard){
				System.out.println("\t"+sonBoard.getBoardName());
				
			}
		}
	}
}

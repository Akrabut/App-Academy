public class FindSumCombinations {

  static int start = 5;
  static int comb1 = 0;
  static int comb2 = 0;

  public static void main(String[] args) {
      comb1(start);
  }
  public static int comb1(int x){
      if(x == 0) return 0;
      comb1 = x;
      comb2(x);
      return comb1(x-1);
  }

  public static int comb2(int x){
      if(x == 0) return 0;
      comb2 = x;
      comb3(x);
      return comb2(x-1);
  }

  public static int comb3(int x){
      if(x == 0) return 0;
      if(x + comb2 + comb1 == start){
          System.out.println(comb1 + "+" + comb2 + "+" + x);
          System.out.println(x + "+" + comb1 + "+" + comb2);
          System.out.println(comb2 + "+" + x + "+" + comb1);
      }
      return comb3(x-1);
  }

}

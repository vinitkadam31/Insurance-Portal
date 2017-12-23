package Scala

object Rules {
    def isValid2(email: String): Boolean =
  """(\w+)@([\w\.]+)""".r.unapplySeq(email).isDefined


  def isValid3(email: String)={
    if(isValid2(email))
    {
	    true
    }
    else
    {
	    false
    }
  }
    
   def insuranceAmountCheck(insurance:Int,annualincome:Int):Boolean={
    if(insurance <= (0.5*annualincome))
    {
    	true
    }
    else
    {
    	false
    }

  }
   
   def isEmpty(sOpt: Option[String]) = sOpt.forall(_.trim.isEmpty)

    def isStringEmpty(x:String):Boolean={
    if(isEmpty(Some(x)))
    {
    	true
    }
    else
    {
    	false
    }

  }
   
   def isStringmatch(x:String,y:String):Boolean = {

    if(x == y)
    {
    	 true
    }
    else
    {
    	 false
    }
  }
   
   def isProductIdYear(productid1:Int,year1:Int,useryear2:Int):Boolean={
    if(useryear2<=year1)
    {
    	true
    }
    else
    {
    	false
    }

  }
   
   def RecalculateAmt(yesnoo: String,amount:Float):Float= {
    var a:Float = 0
    var i:Int = 0
    var len:Int= yesnoo.length() 
    yesnoo.toList
    var yn  = yesnoo.toList
    //println(len)
    //println(i)
    questions(amount)
    def questions( amount:Float){
    if(i<len)
    {
    	if(yn(i) == '1')
    	{
    
    		a = amount - (amount/100)
    		//println(a)
    		
    	}
    	else if(yn(i) == '0')
    	      {
    			a= amount
    			//println(a)		
    	      }
    i += 1
    //println(i)
    questions(a)
    }
    
    }
    a
  }
   
   
   def monthly(polamount1: Float,year :Float):Float = {
	polamount1/(year*12)}

  def quarterly(polamount1: Float,year :Float):Float = {
  	polamount1/(year*4)}
  
  def halfYearly(polamount1: Float,year :Float):Float = {
  	polamount1/(year*2)}
  
  def Annualy(polamount1: Float,year :Float):Float = {
  	polamount1/(year*1)}
  
  def installment(polamount: Float,year:Float,instmt:Float):Float= {
  
    var amount :Float = 0
    var polamount1 :Float =0
    
    polamount1 = polamount/2 //50%
    
    if(instmt == 1)
    {
    	amount=monthly(polamount1,year)
    }
    else  if(instmt == 3)
    	{
    		amount=quarterly(polamount1,year)
    		
    	}
    	else if(instmt == 6)
             	{
    			   amount=halfYearly(polamount1,year)
    		 
    	       } 
    		else if(instmt == 12)
    		      {
    				amount=Annualy(polamount1,year)
    				
    		      }
    amount
  }

}
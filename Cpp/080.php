 <?
   for ($n = 2; $n < 100; $n++)
      if (!strpos(bcsqrt($n, 2), '.00'))
         $total += array_sum(str_split(bcsqrt($n, 99)));
   echo $total;
?>
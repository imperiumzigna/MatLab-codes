function teste(void)
{
   int32_T s1_iter;

   s1_iter = 1;
   do {
      func();
      s1_iter++;
   } while (flag && (s1_iter <= 100));

}
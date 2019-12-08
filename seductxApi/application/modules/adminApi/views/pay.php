<script>
function onSpankPayPayment(payment) {
  console.log(`Payment ${payment.status}`, payment)
}
</script>

<body><button
    data-spankpay-key="test_pk_exposed_mess_opJ78qMrh9OcOP1twFpQKvgByTSopH22bxOi8Hf"
    data-amount= "1"
    data-currency="USD"
    data-accepted-currencies="ETH,LTC,BTC"
    data-metadata="{&quot;orderId&quot;: &quot;sc696969&quot;}"
    data-callback-url="http://localhost/seductxApi/escort/add_subscription?plan_id=<?php echo $_REQUEST['planId']?>&amount=<?php echo $_REQUEST['amount']?>&escort_id=<?php echo $_REQUEST['escortId']?>"
    data-on-payment="onSpankPayPayment">
  Pay with SpankPay!
</button></body><script src="https://pay.spankchain.com/spankpay.js"></script>


<a href="http://localhost/seductxApi/escort/add_subscription?plan_id=<?php echo $_REQUEST['planId']?>&amount=<?php echo $_REQUEST['amount']?>&escort_id=<?php echo $_REQUEST['escortId']?>">click here</a>


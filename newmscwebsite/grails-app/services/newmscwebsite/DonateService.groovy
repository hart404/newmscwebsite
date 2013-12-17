package newmscwebsite

import net.authorize.Environment
import net.authorize.Merchant
import net.authorize.TransactionType
import net.authorize.aim.Result
import net.authorize.aim.Transaction
import net.authorize.data.creditcard.CreditCard
import net.authorize.data.Customer

class DonateService {
	
	def grailsApplication

	def processDonation(creditCardNumber, expirationMonth, expirationYear) {
		def apiLoginId = grailsApplication.config.authorize.net.api.login.identity
		def transactionKey = grailsApplication.config.authorize.net.transaction.key
		Merchant merchant = Merchant.createMerchant(Environment.SANDBOX, apiLoginId, transactionKey)
		CreditCard creditCard = CreditCard.createCreditCard()
		creditCard.setCreditCardNumber(creditCardNumber.toString())
		creditCard.setExpirationMonth(expirationMonth.toString())
		creditCard.setExpirationYear(expirationYear.toString())
		
		Customer customer
		
		// Create AUTH transaction
		Transaction authCaptureTransaction = merchant.createAIMTransaction(TransactionType.AUTH_CAPTURE, new BigDecimal("1.99"))
		authCaptureTransaction.setCreditCard(creditCard)

		Result<Transaction> result = (Result<Transaction>) merchant.postTransaction(authCaptureTransaction)

		println result.getTarget().getTransactionId()
		println "responseCode = " + result.getResponseCode()
		println "responseText = " + result.getResponseText()
		println "reasonResponseCode = " + result.getReasonResponseCode()
	}
}

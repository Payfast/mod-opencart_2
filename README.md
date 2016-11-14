mod_opencart_2
==============
Copyright (c) 2016 PayFast (Pty) Ltd

LICENSE:

This payment module is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

This payment module is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
License for more details.

Please see http://www.opensource.org/licenses/ for a copy of the GNU Lesser
General Public License.

INTEGRATION:
1. Unzip the module to a temporary location on your computer
2. Copy the “admin” and “catalog” folders in the archive to your base “OpenCart” folder
- This should NOT overwrite any existing files or folders and merely supplement them with the PayFast files
- This is however, dependent on the FTP program you use
- If you are concerned about this, rather copy the individual files across as per instructions below
3. Login to the admin section of your OpenCart installation
4. Navigate to the Extensions > Payments page
5. Scroll down to the PayFast.co.za payment method and click the “Install” button to install the module
6. Once the module is installed, click on “Edit” button.
7. The PayFast options will then be shown, select the payment status for “completed”, “failed” and “pending” payments, select the sandbox mode, enable the payment module and click “Save”.
8. The module is now ready to be tested with the Sandbox. To test with the sandbox, use the following login credentials when redirected to the PayFast site:
- Username: sbtu01@payfast.co.za
- Password: clientpass
9. When you are ready to go live input your PayFast merchant ID, Key and passphrase (if it is set on your account), and set sandbox to 'no'.
10. Click save.
11. For a recurring billing product, the initial payment amount will be that of the product price (setup under Catalog->Products) and shipping, the recurring amount will be the price set under 'Recurring Profile'.
12. It is NOT possible to use the recurring trial period with OpenCart and PayFast for recurring products.
13. OpenCart uses slightly different language to PayFast when it comes to recurring, due to this 'Cycle' in Recurring Profile MUST be set to 1. Duration is the number of payments (what PayFast refers to as cycles).
14. It is only possible to use the 'Month' and 'Year' frequency with PayFast and Opencart.
15. In order to cancel a subscription you can  log into your PayFast account and cancel the subscription.

******************************************************************************
*                                                                            *
*    Please see the URL below for all information concerning this module:    *
*                                                                            *
*              https://www.payfast.co.za/shopping-carts/opencart/            *
*                                                                            *
******************************************************************************
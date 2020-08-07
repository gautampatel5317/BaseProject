<?php

use Carbon\Carbon as Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmailTemplateTableSeeder extends Seeder {
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run() {
		// if (env('DB_CONNECTION') == 'mysql') {
			DB::table(config('tables.email_templates.table'))->truncate();
		// }
		$data = [
			[
				'title'   => 'User Registration',
				'type_id' => '1',
				'subject' => 'You have succesfully registerd',
				'body'    => '<center>
<table id="bodyTable" border="0" width="100%" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td id="bodyCell" align="center" valign="top">
<table id="templateContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td align="left" valign="top">
<table id="templateBody" border="0" width="600" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="bodyContainer" style="padding-top: 9px; padding-bottom: 9px;" valign="top">
<table class="mcnBoxedTextBlock" border="0" width="100%" cellspacing="0" cellpadding="0">
<tbody class="mcnBoxedTextBlockOuter">
<tr>
<td class="mcnBoxedTextBlockInner" valign="top">
<table class="mcnBoxedTextContentContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="left">
<tbody>
<tr>
<td style="padding: 9px 18px 9px 18px;">
<table class="mcnTextContentContainer" style="background-color: #ffffff;" border="0" width="100%" cellspacing="0" cellpadding="18">
<tbody>
<tr>
<td class="mcnTextContent" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: left; padding: 36px; word-break: break-word;" valign="top">
<div style="text-align: left; word-wrap: break-word;">Thank you for joining [app_name]! To finish signing up, you just need to confirm your account. <br /> <br />To confirm your email, please click this link:&nbsp;
[confirmation_link] <br /> <br />Welcome and thanks! <br />[app_name] Team
<div class="footer" style="font-size: 0.7em; padding: 0px; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: right; color: #777777; line-height: 14px; margin-top: 36px;">&copy;
 [app_name]</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<!-- // END BODY --></td>
</tr>
</tbody>
</table>
<!-- // END TEMPLATE --></td>
</tr>
</tbody>
</table>
</center>',
				'status'     => '1',
				'created_by' => '1',
				'updated_by' => null,
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],

			[
				'title'   => 'Create User',
				'type_id' => '2',
				'subject' => 'Congratulations! your account has been created',
				'body'    => '<center>
<table id="bodyTable" border="0" width="100%" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td id="bodyCell" align="center" valign="top">
<table id="templateContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td align="left" valign="top">
<table id="templateBody" border="0" width="600" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="bodyContainer" style="padding-top: 9px; padding-bottom: 9px;" valign="top">
<table class="mcnBoxedTextBlock" border="0" width="100%" cellspacing="0" cellpadding="0">
<tbody class="mcnBoxedTextBlockOuter">
<tr>
<td class="mcnBoxedTextBlockInner" valign="top">
<table class="mcnBoxedTextContentContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="left">
<tbody>
<tr>
<td style="padding: 9px 18px 9px 18px;">
<table class="mcnTextContentContainer" style="background-color: #ffffff;" border="0" width="100%" cellspacing="0" cellpadding="18">
<tbody>
<tr>
<td class="mcnTextContent" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: left; padding: 36px; word-break: break-word;" valign="top">
<div style="text-align: left; word-wrap: break-word;">Congratulations! your account has been created</div>
<div style="text-align: left; word-wrap: break-word;">&nbsp;
</div>
<div style="text-align: left; word-wrap: break-word;">&nbsp;
</div>
<div style="text-align: left; word-wrap: break-word;">Your credentials are as below</div>
<div style="text-align: left; word-wrap: break-word;">&nbsp;
</div>
<div style="text-align: left; word-wrap: break-word;">Email - [email]</div>
<div style="text-align: left; word-wrap: break-word;">Password - [password]</div>
<div style="text-align: left; word-wrap: break-word;">&nbsp;
</div>
<div style="text-align: left; word-wrap: break-word;"><br />Welcome and thanks! <br />[app_name] Team
<div class="footer" style="font-size: 0.7em; padding: 0px; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: right; color: #777777; line-height: 14px; margin-top: 36px;">&copy;
 [app_name]</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<!-- // END BODY --></td>
</tr>
</tbody>
</table>
<!-- // END TEMPLATE --></td>
</tr>
</tbody>
</table>
</center>',
				'status'     => '1',
				'created_by' => '1',
				'updated_by' => null,
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],

			[
				'title'   => 'Activate / Deactivate User',
				'type_id' => '3',
				'subject' => 'Your account has been [status]',
				'body'    => '<center>
<table id="bodyTable" border="0" width="100%" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td id="bodyCell" align="center" valign="top">
<table id="templateContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td align="left" valign="top">
<table id="templateBody" border="0" width="600" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="bodyContainer" style="padding-top: 9px; padding-bottom: 9px;" valign="top">
<table class="mcnBoxedTextBlock" border="0" width="100%" cellspacing="0" cellpadding="0">
<tbody class="mcnBoxedTextBlockOuter">
<tr>
<td class="mcnBoxedTextBlockInner" valign="top">
<table class="mcnBoxedTextContentContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="left">
<tbody>
<tr>
<td style="padding: 9px 18px 9px 18px;">
<table class="mcnTextContentContainer" style="background-color: #ffffff;" border="0" width="100%" cellspacing="0" cellpadding="18">
<tbody>
<tr>
<td class="mcnTextContent" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: left; padding: 36px; word-break: break-word;" valign="top">
<div style="text-align: left; word-wrap: break-word;">Your account has been [status].<br /> <br />Welcome and thanks! <br />[app_name] Team
<div class="footer" style="font-size: 0.7em; padding: 0px; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: right; color: #777777; line-height: 14px; margin-top: 36px;">&copy;
 [app_name]</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<!-- // END BODY --></td>
</tr>
</tbody>
</table>
<!-- // END TEMPLATE --></td>
</tr>
</tbody>
</table>
</center>',
				'status'     => '1',
				'created_by' => '1',
				'updated_by' => null,
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],

			[
				'title'   => 'Change Password',
				'type_id' => '4',
				'subject' => 'Your passwprd has been changed successfully',
				'body'    => '<center>
<table id="bodyTable" border="0" width="100%" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td id="bodyCell" align="center" valign="top">
<table id="templateContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="center">
<tbody>
<tr>
<td align="left" valign="top">
<table id="templateBody" border="0" width="600" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="bodyContainer" style="padding-top: 9px; padding-bottom: 9px;" valign="top">
<table class="mcnBoxedTextBlock" border="0" width="100%" cellspacing="0" cellpadding="0">
<tbody class="mcnBoxedTextBlockOuter">
<tr>
<td class="mcnBoxedTextBlockInner" valign="top">
<table class="mcnBoxedTextContentContainer" border="0" width="600" cellspacing="0" cellpadding="0" align="left">
<tbody>
<tr>
<td style="padding: 9px 18px 9px 18px;">
<table class="mcnTextContentContainer" style="background-color: #ffffff;" border="0" width="100%" cellspacing="0" cellpadding="18">
<tbody>
<tr>
<td class="mcnTextContent" style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: left; padding: 36px; word-break: break-word;" valign="top">
<div style="text-align: left; word-wrap: break-word;">Your password has been changed successfully.</div>
<div style="text-align: left; word-wrap: break-word;">&nbsp;
</div>
<div style="text-align: left; word-wrap: break-word;">New password : [password]<br /> <br />Welcome and thanks! <br />[app_name] Team
<div class="footer" style="font-size: 0.7em; padding: 0px; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; text-align: right; color: #777777; line-height: 14px; margin-top: 36px;">&copy;
 [app_name]</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<!-- // END BODY --></td>
</tr>
</tbody>
</table>
<!-- // END TEMPLATE --></td>
</tr>
</tbody>
</table>
</center>',
				'status'     => '1',
				'created_by' => '1',
				'updated_by' => null,
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
            ],
            
            [
				'title'   => 'Forgot Password',
				'type_id' => '5',
				'subject' => 'Reset your Password',
				'body'    => '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

                <html xmlns="http://www.w3.org/1999/xhtml">
                
                <head>
                
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                
                    <title>Forgot Password</title>
                
                    <style>
                
                        body {
                
                            background-color: #FFFFFF; padding: 0; margin: 0;
                
                        }
                
                    </style>
                
                </head>
                
                <body style="background-color: #FFFFFF; padding: 0; margin: 0;">
                
                <table border="0" cellpadding="0" cellspacing="10" height="100%" bgcolor="#FFFFFF" width="100%" style="max-width: 650px;" id="bodyTable">
                
                    <tr>
                
                        <td align="center" valign="top">
                
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" id="emailContainer" style="font-family:Arial; color: #333333;">
                                               
                                <!-- Title -->
                
                                <tr>
                
                                    <td align="left" valign="top" colspan="2" style="border-bottom: 1px solid #CCCCCC; padding: 20px 0 10px 0;">
                
                                        <span style="font-size: 18px; font-weight: normal;">FORGOT PASSWORD</span>
                
                                    </td>
                
                                </tr>
                
                                <!-- Messages -->
                
                                <tr>
                
                                    <td align="left" valign="top" colspan="2" style="padding-top: 10px;">
                
                                        <span style="font-size: 12px; line-height: 1.5; color: #333333;">
                
                                            We have sent you this email in response to your request to reset your password on [app_name]. After you reset your password, any credit card information stored in My Account will be deleted as a security measure.
                
                                            <br/><br/>
                
                                            To reset your password for [app_name], please follow the link below:
                
                                            <a href="[password_reset_link]">[password_reset_link]</a>
                
                                            <br/><br/>
                
                                            We recommend that you keep your password secure and not share it with anyone.If you feel your password has been compromised, you can change it by going to your [app_name] My Account Page and clicking on the "Change Email Address or Password" link.
                
                                            <br/><br/>
                
                                            [app_name] Customer Service
                
                                        </span>
                
                                    </td>
                
                                </tr>
                
                            </table>
                
                        </td>
                
                    </tr>
                
                </table>
                
                </body>
                
                </html>',
				'status'     => '1',
				'created_by' => '1',
				'updated_by' => null,
				'created_at' => Carbon::now(),
				'updated_at' => Carbon::now(),
			],
		];

		DB::table(config('tables.email_templates.table'))->insert($data);
	}
}

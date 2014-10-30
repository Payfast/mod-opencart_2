<?php
    /**
     * admin/view/template/payment/payfast.tpl
     *
     * Copyright (c) 2009-2012 PayFast (Pty) Ltd
     *
     * LICENSE:
     *
     * This payment module is free software; you can redistribute it and/or modify
     * it under the terms of the GNU Lesser General Public License as published
     * by the Free Software Foundation; either version 3 of the License, or (at
     * your option) any later version.
     *
     * This payment module is distributed in the hope that it will be useful, but
     * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
     * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
     * License for more details.
     *
     * @author     Ron Darby
     * @copyright  2009-2012 PayFast (Pty) Ltd
     * @license    http://www.opensource.org/licenses/lgpl-license.php LGPL
     * @version    2.0.0
     */

    ?>

<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-payfast" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if (isset($error['error_warning'])) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">


                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payfast"
                      class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a>
                        </li>
                        <li><a href="#tab-status" data-toggle="tab"><?php echo $tab_status; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label"
                                       for="entry-merchant_id"><?php echo $entry_merchant_id; ?></label>

                                <div class="col-sm-10">
                                    <input type="text" name="payfast_merchant_id"
                                           value="<?php echo $payfast_merchant_id; ?>" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label"
                                       for="entry-merchant_key"><?php echo $entry_merchant_key; ?></label>

                                <div class="col-sm-10">
                                    <input type="text" name="payfast_merchant_key"
                                           value="<?php echo $payfast_merchant_key; ?>" class="form-control"></div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-sandbox"><?php echo $entry_sandbox; ?></label>

                                <div class="col-sm-10">
                                    <input type="radio" name="payfast_sandbox"
                                           value="1" <?php if ($payfast_sandbox) { ?> checked="checked" <?php }; ?> >
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="payfast_sandbox"
                                           value="0" <?php if (!$payfast_sandbox) { ?> checked="checked" <?php }; ?> >
                                    <?php echo $text_no; ?>
                                </div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-debug"><?php echo $text_debug; ?></label>

                                <div class="col-sm-10">
                                    <input type="radio" name="payfast_debug" value="1" <?php if ($payfast_debug) { ?>
                                    checked="checked" <?php }; ?> >
                                    <?php echo $text_yes; ?>
                                    <input type="radio" name="payfast_debug" value="0" <?php if (!$payfast_debug) { ?>
                                    checked="checked" <?php }; ?> >
                                    <?php echo $text_no; ?>
                                </div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-passphrase"><?php echo $entry_passphrase; ?>
                                    <span style="font-weight: bold;font-size:10px;"><?php echo $entry_passphrase_info; ?></span></label>

                                <div class="col-sm-10"><input type="text" name="payfast_passphrase"
                                                              value="<?php echo $payfast_passphrase; ?>" class="form-control"></div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-total"><?php echo $entry_total; ?></label>

                                <div class="col-sm-10"><input type="text" name="payfast_total"
                                                              value="<?php echo $payfast_total; ?>" class="form-control"></div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-geo_zone_id"><?php echo $entry_geo_zone; ?></label>

                                <div class="col-sm-10"><select name="payfast_geo_zone_id" class="form-control">
                                        <option value="0"><?php echo $text_all_zones; ?></option>
                                        <?php foreach ($geo_zones as $geo_zone) { ?>
                                        <?php if ($geo_zone['geo_zone_id'] == $payfast_geo_zone_id) { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"
                                                selected="selected"><?php echo $geo_zone['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select></div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-status"><?php echo $entry_status; ?></label>

                                <div class="col-sm-10"><select name="payfast_status" class="form-control">
                                        <?php if ($payfast_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select></div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-sort_order"><?php echo $entry_sort_order; ?></label>

                                <div class="col-sm-10">
                                    <input type="text" name="payfast_sort_order"
                                           value="<?php echo $payfast_sort_order; ?>" size="1" class="form-control"></div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-status">
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-completed_status"><?php echo $entry_completed_status; ?></label>

                                <div class="col-sm-10"><select name="payfast_completed_status_id" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $payfast_completed_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"
                                                selected="selected"><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select></div>
                            </div>


                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-failed_status"><?php echo $entry_failed_status; ?></label>

                                <div class="col-sm-10"><select name="payfast_failed_status_id" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $payfast_failed_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"
                                                selected="selected"><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select></div>
                            </div>
                            <div class="form-group">      
                                <label class="col-sm-2 control-label"
                                       for="entry-cancelled_status"><?php echo $entry_cancelled_status; ?></label>

                                <div class="col-sm-10"><select name="payfast_cancelled_status_id" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $payfast_cancelled_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"
                                                selected="selected"><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select></div>
                            </div>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
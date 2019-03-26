<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>"
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
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category"
                          class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="wuunder_api" id="input-status" class="form-control">
                                    <?php if ($wuunder_api) { ?>
                                        <option value="1" selected="selected"><?php echo $live_api; ?></option>
                                        <option value="0"><?php echo $staging_api; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $live_api; ?></option>
                                        <option value="0" selected="selected"><?php echo $staging_api; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-staging-key"><?php echo $text_staging_api; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="input-staging-key" name="wuunder_staging_key"
                                       class="form-control" value="<?php echo $staging_key; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="input-live-key"><?php echo $text_live_api; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="input-live-key" name="wuunder_live_key" class="form-control"
                                       value="<?php echo $live_key; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_business"><?php echo $text_business; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_business" name="wuunder_business" class="form-control"
                                       value="<?php echo $business; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_email_address"><?php echo $text_email_address; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_email_address" name="wuunder_email_address"
                                       class="form-control" value="<?php echo $email_address; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_family_name"><?php echo $text_family_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_family_name" name="wuunder_family_name"
                                       class="form-control" value="<?php echo $family_name; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_given_name"><?php echo $text_given_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_given_name" name="wuunder_given_name"
                                       class="form-control" value="<?php echo $given_name; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_locality"><?php echo $text_locality; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_locality" name="wuunder_locality" class="form-control"
                                       value="<?php echo $locality; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_phone_number"><?php echo $text_phone_number; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_phone_number" name="wuunder_phone_number"
                                       class="form-control" value="<?php echo $phone_number; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_street_name"><?php echo $text_street_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_street_name" name="wuunder_street_name"
                                       class="form-control" value="<?php echo $street_name; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_house_number"><?php echo $text_house_number; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_house_number" name="wuunder_house_number"
                                       class="form-control" value="<?php echo $house_number; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_zip_code"><?php echo $text_zip_code; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_zip_code" name="wuunder_zip_code" class="form-control"
                                       value="<?php echo $zip_code; ?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"
                                   for="wuunder_country"><?php echo $text_country; ?></label>
                            <div class="col-sm-10">
                                <input type="text" id="wuunder_country" name="wuunder_country" class="form-control"
                                       value="<?php echo $country; ?>"/>
                            </div>
                        </div>
                        <h2><?php echo $text_shipping_section; ?></h2>
                        <div class="well well-lg">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="wuunder_shipping_dimensions"><?php echo $text_shipping_dimensions; ?></label>
                                <div class="col-sm-10">
                                    <div class="col-sm-4">
                                        <input type="text" id="wuunder_shipping_length" name="wuunder_shipping_length"
                                               class="form-control" value="<?php echo $shipping_length; ?>"/>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" id="wuunder_shipping_width" name="wuunder_shipping_width"
                                               class="form-control" value="<?php echo $shipping_width; ?>"/>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" id="wuunder_shipping_height" name="wuunder_shipping_height"
                                               class="form-control" value="<?php echo $shipping_height; ?>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="wuunder_base_url"><?php echo $text_shipping_weight; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" id="wuunder_shipping_weight" name="wuunder_shipping_weight"
                                           class="form-control" value="<?php echo $shipping_weight; ?>"/>
                                </div>
                            </div>
                        </div>
                        <h2><?php echo $text_advanced_section; ?></h2>
                        <div class="well well-lg">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="wuunder_custom_housenumber"><?php echo $text_custom_field_housenumber; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" id="wuunder_custom_housenumber" name="wuunder_custom_housenumber"
                                           class="form-control" value="<?php echo $custom_housenumber; ?>"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="wuunder_base_url"><?php echo $text_base_url; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" id="wuunder_base_url" name="wuunder_base_url"
                                           class="form-control" value="<?php echo $base_url; ?>"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="wuunder_base_admin_url"><?php echo $text_base_admin_url; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" id="wuunder_base_admin_url" name="wuunder_base_admin_url"
                                           class="form-control" value="<?php echo $base_admin_url; ?>"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>
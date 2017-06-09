<?php

class ControllerExtensionModuleWuunder extends Controller
{

    public function index()
    {

    }

    public function webhook()
    {
        if (isset($_REQUEST['order']) && isset($_REQUEST['token'])) {
            $order_id = $_REQUEST['order'];
            $booking_token = $_REQUEST['token'];
            $ss = $this->db->escape(json_encode($_REQUEST));
            $this->db->query("UPDATE `wuunder_shipment` SET label_url = '" . $ss . "', label_tt_url = 'tt_test' WHERE order_id = " . $order_id . " AND booking_token = '" . $booking_token . "'");
        }
    }
}
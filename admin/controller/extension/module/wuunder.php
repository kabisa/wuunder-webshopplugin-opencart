<?php

class ControllerExtensionModuleWuunder extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/module/wuunder');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('wuunder', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['staging_api'] = $this->language->get('staging_api');
        $data['live_api'] = $this->language->get('live_api');
        $data['text_staging_api'] = $this->language->get('text_staging_api');
        $data['text_live_api'] = $this->language->get('text_live_api');

        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/wuunder', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/module/wuunder', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            $data['wuunder_api'] = $this->request->post['wuunder_api'];
            $data['staging_key'] = $this->request->post['wuunder_staging_key'];
            $data['live_key'] = $this->request->post['wuunder_live_key'];
        } else {
            $data['wuunder_api'] = $this->config->get('wuunder_api');
            $data['staging_key'] = $this->config->get('wuunder_staging_key');
            $data['live_key'] = $this->config->get('wuunder_live_key');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/wuunder', $data));
    }

    public function install()
    {
        $this->db->query("DROP TABLE IF EXISTS `wuunder_shipment`;");
        $this->db->query("CREATE TABLE IF NOT EXISTS wuunder_shipment (
	  `shipment_id` int(10) NOT NULL AUTO_INCREMENT,
	  `order_id` int(10) NOT NULL,
	  `label_id` varchar(255) DEFAULT NULL,
	  `label_date` int(10) NOT NULL DEFAULT '0',
	  `label_url` text DEFAULT NULL,
	  `label_tt_url` text DEFAULT NULL,
	  `booking_url` text DEFAULT NULL,
	  `retour_id` varchar(255) DEFAULT NULL,
	  `retour_date` int(10) NOT NULL DEFAULT '0',
	  `retour_url` text DEFAULT NULL,
	  `retour_tt_url` text DEFAULT NULL,
	  PRIMARY KEY (`shipment_id`)
	) ENGINE=InnoDB  DEFAULT CHARSET=utf8;");
    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/wuunder')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function getLabelInfo($order_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM wuunder_shipment WHERE order_id = '" . (int)$order_id . "'");

        if ($query->num_rows) {
            return $query->row;
        } else {
            return false;
        }
    }
}
<?php
/**
 * admin/controller/payment/payfast.php
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
 * @version    1.1.1
 */

class ControllerPaymentPayFast extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/payfast');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payfast', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_authorization'] = $this->language->get('text_authorization');
		$data['text_sale'] = $this->language->get('text_sale');

		$data['entry_sandbox'] = $this->language->get('entry_sandbox');
		$data['entry_debug'] = $this->language->get('entry_debug');
		$data['entry_total'] = $this->language->get('entry_total');	
		$data['entry_completed_status'] = $this->language->get('entry_completed_status');
		$data['entry_failed_status'] = $this->language->get('entry_failed_status');
		$data['entry_cancelled_status'] = $this->language->get('entry_cancelled_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_merchant_id'] = $this->language->get('entry_merchant_id');
        $data['entry_merchant_key'] = $this->language->get('entry_merchant_key');
        $data['text_debug'] = $this->language->get('text_debug');
        $data['entry_passphrase'] = $this->language->get('entry_passphrase');
        $data['entry_passphrase_info'] = $this->language->get('entry_passphrase_info');
        $data['text_edit'] = $this->language->get( 'text_edit' );

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');


        $data['tab_general'] = $this->language->get('tab_general');
      		$data['tab_status'] = $this->language->get('tab_status');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/payfast', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('payment/payfast', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['payfast_merchant_id'])) {
			$data['payfast_merchant_id'] = $this->request->post['payfast_merchant_id'];
		} else {
			$data['payfast_merchant_id'] = $this->config->get('payfast_merchant_id');
		}
        if (isset($this->request->post['payfast_merchant_key'])) {
			$data['payfast_merchant_key'] = $this->request->post['payfast_merchant_key'];
		} else {
			$data['payfast_merchant_key'] = $this->config->get('payfast_merchant_key');
		}

		if (isset($this->request->post['payfast_sandbox'])) {
			$data['payfast_sandbox'] = $this->request->post['payfast_sandbox'];
		} else {
			$data['payfast_sandbox'] = $this->config->get('payfast_sandbox');
		}
		if (isset($this->request->post['payfast_passphrase'])) {
			$data['payfast_passphrase'] = $this->request->post['payfast_passphrase'];
		} else {
			$data['payfast_passphrase'] = $this->config->get('payfast_passphrase');
		}

		if (isset($this->request->post['payfast_transaction'])) {
			$data['payfast_transaction'] = $this->request->post['payfast_transaction'];
		} else {
			$data['payfast_transaction'] = $this->config->get('payfast_transaction');
		}

		if (isset($this->request->post['payfast_debug'])) {
			$data['payfast_debug'] = $this->request->post['payfast_debug'];
		} else {
			$data['payfast_debug'] = $this->config->get('payfast_debug');
		}
		
		if (isset($this->request->post['payfast_total'])) {
			$data['payfast_total'] = $this->request->post['payfast_total'];
		} else {
			$data['payfast_total'] = $this->config->get('payfast_total'); 
		} 
		
		if (isset($this->request->post['payfast_completed_status_id'])) {
			$data['payfast_completed_status_id'] = $this->request->post['payfast_completed_status_id'];
		} else {
			$data['payfast_completed_status_id'] = $this->config->get('payfast_completed_status_id');
		}	
						
		if (isset($this->request->post['payfast_failed_status_id'])) {
			$data['payfast_failed_status_id'] = $this->request->post['payfast_failed_status_id'];
		} else {
			$data['payfast_failed_status_id'] = $this->config->get('payfast_failed_status_id');
		}	
								
		if (isset($this->request->post['payfast_cancelled_status_id'])) {
			$data['payfast_cancelled_status_id'] = $this->request->post['payfast_cancelled_status_id'];
		} else {
			$data['payfast_cancelled_status_id'] = $this->config->get('payfast_cancelled_status_id');
		}
		
		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['payfast_geo_zone_id'])) {
			$data['payfast_geo_zone_id'] = $this->request->post['payfast_geo_zone_id'];
		} else {
			$data['payfast_geo_zone_id'] = $this->config->get('payfast_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['payfast_status'])) {
			$data['payfast_status'] = $this->request->post['payfast_status'];
		} else {
			$data['payfast_status'] = $this->config->get('payfast_status');
		}
		
		if (isset($this->request->post['payfast_sort_order'])) {
			$data['payfast_sort_order'] = $this->request->post['payfast_sort_order'];
		} else {
			$data['payfast_sort_order'] = $this->config->get('payfast_sort_order');
		}


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('payment/payfast.tpl', $data));

	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/payfast')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>